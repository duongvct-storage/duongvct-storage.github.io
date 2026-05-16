--[[
    Table filter

    Wraps tables in a div with class "table-wrapper" to allow horizontal
    scrolling on small screens.
]]
local function Table(elem)
    return pandoc.Div({elem}, { class = "table-wrapper" })
end

return { { Table = Table } }