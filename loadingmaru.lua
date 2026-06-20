local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====== Tạo ScreenGui ======
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Nền đen mờ (trong suốt một phần, vẫn thấy được game phía sau)
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0.15 -- chỉnh số này để tối/sáng hơn (0 = đen đặc, 1 = trong suốt hoàn toàn)
background.BorderSizePixel = 0
background.ZIndex = 1
background.Parent = screenGui

-- Vòng tròn trắng (viền) — vẽ bằng Frame + UICorner + UIStroke, không cần ảnh ngoài
local circle = Instance.new("Frame")
circle.Name = "Circle"
circle.AnchorPoint = Vector2.new(0.5, 0.5)
circle.Position = UDim2.new(0.5, 0, 0.45, 0)
circle.Size = UDim2.new(0, 90, 0, 90)
circle.BackgroundTransparency = 1
circle.ZIndex = 2
circle.Parent = background

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0) -- bo tròn 100% = hình tròn
circleCorner.Parent = circle

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.new(1, 1, 1)
circleStroke.Thickness = 10
circleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
circleStroke.Parent = circle

-- Chữ "Loading..."
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.Position = UDim2.new(0.5, 0, 0.45, 90)
loadingText.Size = UDim2.new(0, 300, 0, 40)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading..."
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.Font = Enum.Font.GothamBold
loadingText.TextSize = 28
loadingText.ZIndex = 2
loadingText.Parent = background

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Maru Hub",
    Text = "Success!",
    Icon = "rbxassetid://9681970193",
    Duration = 15
})

local blinkTween = TweenService:Create(
	loadingText,
	TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0),
	{TextTransparency = 0.4}
)
blinkTween:Play()

-- ====== Hiệu ứng phóng to một tí rồi thu lại, lặp lại mỗi 5 giây ======
local originalSize = circle.Size
local pulseSize = UDim2.new(0, originalSize.X.Offset * 1.15, 0, originalSize.Y.Offset * 1.15)

local pulseLoopActive = true

local function playPulse()
	if not pulseLoopActive then return end

	local growTween = TweenService:Create(
		circle,
		TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		{Size = pulseSize}
	)
	growTween:Play()

	growTween.Completed:Connect(function()
		if not pulseLoopActive then return end
		local shrinkTween = TweenService:Create(
			circle,
			TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
			{Size = originalSize}
		)
		shrinkTween:Play()
	end)
end

-- Chạy lần đầu ở giây thứ 5, sau đó lặp lại mỗi 5 giây
task.delay(5, function()
	playPulse()
	task.spawn(function()
		while pulseLoopActive do
			task.wait(5)
			if pulseLoopActive then
				playPulse()
			end
		end
	end)
end)

-- ====== Sau 12 giây thì loading biến mất ======
task.delay(12, function()
	blinkTween:Cancel()
	pulseLoopActive = false

	local fadeOutBg = TweenService:Create(
		background,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{BackgroundTransparency = 1}
	)
	local fadeOutCircle = TweenService:Create(
		circleStroke,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{Transparency = 1}
	)
	local fadeOutText = TweenService:Create(
		loadingText,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{TextTransparency = 1}
	)

	fadeOutBg:Play()
	fadeOutCircle:Play()
	fadeOutText:Play()

	fadeOutBg.Completed:Wait()
	background:Destroy()
	circle:Destroy()
	loadingText:Destroy()
end)

-- ====== Sau 15 giây thì khung thông báo "Maru Hub - Success!" biến mất ======
task.delay(15, function()
	local fadeOutNotifFrame = TweenService:Create(
		notifFrame,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{BackgroundTransparency = 1}
	)
	local fadeOutNotifLogoBox = TweenService:Create(
		notifLogoBox,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{BackgroundTransparency = 1}
	)
	local fadeOutNotifLogo = TweenService:Create(
		notifLogo,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ImageTransparency = 1}
	)
	local fadeOutNotifTitle = TweenService:Create(
		notifTitle,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{TextTransparency = 1}
	)
	local fadeOutNotifSubtitle = TweenService:Create(
		notifSubtitle,
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{TextTransparency = 1}
	)

	fadeOutNotifFrame:Play()
	fadeOutNotifLogoBox:Play()
	fadeOutNotifLogo:Play()
	fadeOutNotifTitle:Play()
	fadeOutNotifSubtitle:Play()

	fadeOutNotifFrame.Completed:Wait()
	notifFrame:Destroy()
	screenGui:Destroy() -- không còn gì khác trong ScreenGui nên dọn luôn
end)
