--[[

     Licensed under GNU General Public License v2
      * (c) 2023,      possumvibes
      * (c) 2018,      Eugene Pakhomov
      * (c) 2016,      Henrik Antonsson
      * (c) 2015,      Joerg Jaspert
      * (c) 2014,      projektile
      * (c) 2013,      Luca CPZ
      * (c) 2010-2012, Peter Hofmann

      https://github.com/lcpz/lain
--]]

local floor = math.floor
local max = math.max
local mouse = mouse
local mousegrabber = mousegrabber
local screen = screen

local centerwork = {
    name       = "centerwork",
    horizontal = { name = "centerworkh" }
}

local function arrange(p, layout)
    local t   = p.tag or screen[p.screen].selected_tag
    local wa  = p.workarea
    local cls = p.clients

    if #cls == 0 then return end

    local g = {}

    -- Main column, fixed width and height
    local mwfact          = t.master_width_factor
    local mainhei         = floor(wa.height * mwfact)
    local mainwid         = floor(wa.width * mwfact)
    local periphwid        = wa.width - mainwid
    local periphLwid       = floor(periphwid / 2)
    local periphRwid       = periphwid - periphLwid
    local periphhei        = wa.height - mainhei
    local periphThei       = floor(periphhei / 2)
    local periphBhei       = periphhei - periphThei
    local nbrFirstPeriphs  = floor(#cls / 2)
    local nbrSecondPeriphs = floor((#cls - 1) / 2)

    local periphFirstDim, periphSecondDim = 0, 0

    if layout.name == "centerwork" then -- vertical
        if nbrFirstPeriphs  > 0 then periphFirstDim  = floor(wa.height / nbrFirstPeriphs) end
        if nbrSecondPeriphs > 0 then periphSecondDim = floor(wa.height / nbrSecondPeriphs) end

        g.height = wa.height
        g.width  = mainwid

        g.x = wa.x + periphLwid
        g.y = wa.y
    else -- horizontal
        if nbrFirstPeriphs  > 0 then periphFirstDim  = floor(wa.width / nbrFirstPeriphs) end
        if nbrSecondPeriphs > 0 then periphSecondDim = floor(wa.width / nbrSecondPeriphs) end

        g.height  = mainhei
        g.width = wa.width

        g.x = wa.x
        g.y = wa.y + periphThei
    end

    g.width  = max(g.width, 1)
    g.height = max(g.height, 1)

    p.geometries[cls[1]] = g

    -- Auxiliary clients
    if #cls <= 1 then return end
    for i = 2, #cls do
        g = {}
        local idxChecker, dimToAssign

        local rowIndex = floor(i/2)

        if layout.name == "centerwork" then
            if i % 2 == 0 then -- left periph
                g.x     = wa.x
                g.y     = wa.y + (rowIndex - 1) * periphFirstDim
                g.width = periphLwid

                idxChecker, dimToAssign = nbrFirstPeriphs, periphFirstDim
            else -- right periph
                g.x     = wa.x + periphLwid + mainwid
                g.y     = wa.y + (rowIndex - 1) * periphSecondDim
                g.width = periphRwid

                idxChecker, dimToAssign = nbrSecondPeriphs, periphSecondDim
            end

            -- if last periph in row, use remaining space for it
            if rowIndex == idxChecker then
                g.height = wa.y + wa.height - g.y
            else
                g.height = dimToAssign
            end
        else
            if i % 2 == 0 then -- top periph
                g.x      = wa.x + (rowIndex - 1) * periphFirstDim
                g.y      = wa.y
                g.height = periphThei

                idxChecker, dimToAssign = nbrFirstPeriphs, periphFirstDim
            else -- bottom periph
                g.x      = wa.x + (rowIndex - 1) * periphSecondDim
                g.y      = wa.y + periphThei + mainhei
                g.height = periphBhei

                idxChecker, dimToAssign = nbrSecondPeriphs, periphSecondDim
            end

            -- if last periph in row, use remaining space for it
            if rowIndex == idxChecker then
                g.width = wa.x + wa.width - g.x
            else
                g.width = dimToAssign
            end
        end

        g.width  = max(g.width, 1)
        g.height = max(g.height, 1)

        p.geometries[cls[i]] = g
    end
end

local function mouse_resize_handler(c, _, _, _, orientation)
    local wa     = c.screen.workarea
    local mwfact = c.screen.selected_tag.master_width_factor
    local g      = c:geometry()
    local offset = 0
    local cursor = "cross"

    local corner_coords

    if orientation == 'vertical' then
        if g.height + 15 >= wa.height then
            offset = g.height * .5
            cursor = "sb_h_double_arrow"
        elseif g.y + g.height + 15 <= wa.y + wa.height then
            offset = g.height
        end
        corner_coords = { x = wa.x + wa.width * (1 - mwfact) / 2, y = g.y + offset }
    else
        if g.width + 15 >= wa.width then
            offset = g.width * .5
            cursor = "sb_v_double_arrow"
        elseif g.x + g.width + 15 <= wa.x + wa.width then
            offset = g.width
        end
        corner_coords = { y = wa.y + wa.height * (1 - mwfact) / 2, x = g.x + offset }
    end

    mouse.coords(corner_coords)

    local prev_coords = {}

    mousegrabber.run(function(m)
        if not c.valid then return false end
        for _, v in ipairs(m.buttons) do
            if v then
                prev_coords = { x = m.x, y = m.y }
                local new_mwfact
                if orientation == 'vertical' then
                    new_mwfact = 1 - (m.x - wa.x) / wa.width * 2
                else
                    new_mwfact = 1 - (m.y - wa.y) / wa.height * 2
                end
                c.screen.selected_tag.master_width_factor = math.min(math.max(new_mwfact, 0.01), 0.99)
                return true
            end
        end
        return prev_coords.x == m.x and prev_coords.y == m.y
    end, cursor)
end

function centerwork.arrange(p)
    return arrange(p, centerwork)
end

function centerwork.horizontal.arrange(p)
    return arrange(p, centerwork.horizontal)
end

function centerwork.mouse_resize_handler(c, corner, x, y)
    return mouse_resize_handler(c, corner, x, y, 'vertical')
end

function centerwork.horizontal.mouse_resize_handler(c, corner, x, y)
    return mouse_resize_handler(c, corner, x, y, 'horizontal')
end


--[[
Make focus.byidx and swap.byidx behave more consistently with other layouts.
--]]

local awful = require("awful")
local gears = require("gears")
local client = client

local function compare_position(a, b)
    if a.x == b.x then
        return a.y < b.y
    else
        return a.x < b.x
    end
end

local function clients_by_position()
    local this = client.focus
    if this then
        local sorted = {}
        for _, c in ipairs(client.focus.first_tag:clients()) do
            if not c.minimized then sorted[#sorted+1] = c end
        end
        table.sort(sorted, compare_position)

        local idx = 0
        for i, that in ipairs(sorted) do
            if this.window == that.window then
                idx = i
            end
        end

        if idx > 0 then
            return { sorted = sorted, idx = idx }
        end
    end
    return {}
end

local function in_centerwork()
    return client.focus and client.focus.first_tag.layout.name == "centerwork"
end

centerwork.focus = {}


--[[
Drop in replacements for awful.client.focus.byidx and awful.client.swap.byidx
that behaves consistently with other layouts.
--]]

function centerwork.focus.byidx(i)
    if in_centerwork() then
        local cls = clients_by_position()
        if cls.idx then
            local target = cls.sorted[gears.math.cycle(#cls.sorted, cls.idx + i)]
            awful.client.focus.byidx(0, target)
        end
    else
        awful.client.focus.byidx(i)
    end
end

centerwork.swap = {}

function centerwork.swap.byidx(i)
    if in_centerwork() then
        local cls = clients_by_position()
        if cls.idx then
            local target = cls.sorted[gears.math.cycle(#cls.sorted, cls.idx + i)]
            client.focus:swap(target)
        end
    else
        awful.client.swap.byidx(i)
    end
end

return centerwork
