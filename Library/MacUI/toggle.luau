local cloneref = cloneref or function(x) return x end

--@services
local core_gui        : CoreGui          = cloneref(game:GetService("CoreGui"))
local user_input      : UserInputService = cloneref(game:GetService("UserInputService"))

--@types
type interface_type = {
    is_already_executed : (self: interface_type) -> (),
    toggle_position     : (self: interface_type) -> Instance?,
    initial_interface   : (self: interface_type, callback: (() -> ())?) -> (),
}

--@constants
local GUI_NAME : string = "Ajomok UI"
local ICON_ID  : string = "rbxassetid://104695336294005"

--@gui_builder
local function __create_gui(parent: Instance): ScreenGui
    --@screen_gui
    local screen_gui = Instance.new("ScreenGui", parent)
    screen_gui.Name             = GUI_NAME
    screen_gui.ResetOnSpawn     = false
    screen_gui.DisplayOrder     = 5
    screen_gui.IgnoreGuiInset   = true
    screen_gui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling

    --@main_frame
    local main_frame = Instance.new("Frame", screen_gui)
    main_frame.Name             = "main"
    main_frame.AnchorPoint      = Vector2.new(0, 0.5)
    main_frame.Position         = UDim2.new(0, 5, 0.5, 0)
    main_frame.Size             = UDim2.new(0, 55, 0, 55)
    main_frame.BackgroundColor3 = Color3.new(1, 1, 1)
    main_frame.BorderSizePixel  = 0
    main_frame.Active           = true
    main_frame.Draggable        = false

    --@gradient
    local ui_gradient        = Instance.new("UIGradient", main_frame)
    ui_gradient.Rotation     = 50
    ui_gradient.Color        = ColorSequence.new({
        ColorSequenceKeypoint.new(0,        Color3.new(0.643137, 0.615686, 1)),
        ColorSequenceKeypoint.new(0.515913, Color3.new(0.117647, 0.105882, 0.14902)),
        ColorSequenceKeypoint.new(1,        Color3.new(0.643137, 0.615686, 1)),
    })

    --@corner
    local ui_corner          = Instance.new("UICorner", main_frame)
    ui_corner.CornerRadius   = UDim.new(0, 15)

    --@stroke
    local ui_stroke          = Instance.new("UIStroke", main_frame)
    ui_stroke.Color          = Color3.new(1, 1, 1)
    ui_stroke.Thickness      = 2

    --@stroke_gradient
    local stroke_gradient    = Instance.new("UIGradient", ui_stroke)
    stroke_gradient.Rotation = 90
    stroke_gradient.Color    = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.286275, 0.415686, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(0.137255, 0.137255, 0.137255)),
    })

    --@icon
    local icon_label                  = Instance.new("ImageLabel", main_frame)
    icon_label.Name                   = "imege"
    icon_label.Size                   = UDim2.new(0, 35, 0, 35)
    icon_label.Position               = UDim2.new(0.181818187, 0, 0.181818187, 0)
    icon_label.Image                  = ICON_ID
    icon_label.BackgroundTransparency = 1
    icon_label.BorderSizePixel        = 0
    icon_label.BackgroundColor3       = Color3.new(1, 1, 1)
    icon_label.BorderColor3           = Color3.new(0, 0, 0)

    --@toggle_button
    local toggle_btn                  = Instance.new("TextButton", main_frame)
    toggle_btn.Name                   = "togl"
    toggle_btn.Size                   = UDim2.new(0, 55, 0, 50)
    toggle_btn.BackgroundTransparency = 1
    toggle_btn.BorderSizePixel        = 0
    toggle_btn.BackgroundColor3       = Color3.new(1, 1, 1)
    toggle_btn.BorderColor3           = Color3.new(0, 0, 0)
    toggle_btn.TextColor3             = Color3.new(0, 0, 0)
    toggle_btn.TextTransparency       = 1
    toggle_btn.Font                   = Enum.Font.SourceSans
    toggle_btn.TextSize               = 14
    toggle_btn.ZIndex                 = 9999999

    --@drag_system
    local dragging  : boolean  = false
    local drag_start: Vector3? = nil
    local start_pos : UDim2?   = nil

    local function __update_drag(input: InputObject): ()
        if not drag_start or not start_pos then return end
        local delta = input.Position - drag_start
        main_frame.Position = UDim2.new(
            start_pos.X.Scale,
            start_pos.X.Offset + delta.X,
            start_pos.Y.Scale,
            start_pos.Y.Offset + delta.Y
        )
    end

    local function __begin_drag(input: InputObject): ()
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging   = true
            drag_start = input.Position
            start_pos  = main_frame.Position

            local conn
            conn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    conn:Disconnect()
                end
            end)
        end
    end

    local function __on_drag(input: InputObject): ()
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            __update_drag(input)
        end
    end

    --@drag_connections
    main_frame.InputBegan:Connect(__begin_drag)
    main_frame.InputChanged:Connect(__on_drag)
    toggle_btn.InputBegan:Connect(__begin_drag)
    toggle_btn.InputChanged:Connect(__on_drag)
    user_input.InputChanged:Connect(__on_drag)

    return screen_gui
end

--@get_gui (bypass anti-cheat: parent ke PlayerGui via gethui)
local function __get_parent(): Instance
    local success, result = pcall(function()
        return gethui()
    end)
    if success and result then
        return result
    end
    return core_gui
end

--@interface
local interface: interface_type = {} :: interface_type

function interface:is_already_executed(): ()
    local parent  = __get_parent()
    local existing: Instance? = parent:FindFirstChild(GUI_NAME)
    if existing then
        existing:Destroy()
    end
end

function interface:toggle_position(): Instance?
    return __get_parent():FindFirstChild(GUI_NAME)
end

function interface:initial_interface(callback: (() -> ())?): ()
    local parent            = __get_parent()
    local existing: Instance? = parent:FindFirstChild(GUI_NAME)
    if existing then
        existing:Destroy()
    end

    local ui: ScreenGui    = __create_gui(parent)
    local main: Frame      = ui:FindFirstChild("main") :: Frame
    local togl: TextButton = main:FindFirstChild("togl") :: TextButton

    if callback then
        togl.MouseButton1Click:Connect(function()
            pcall(callback)
        end)
    end
end

return interface
