--[[
    Table filter

    Wraps tables in a div with class "table-wrapper" to allow horizontal
    scrolling on small screens.
]]
local Table = {}

function Table:render(elem)
    local div = pandoc.Div(elem)
    div.classes = { "table-wrapper" }
    return div
end

return {
    { Table = Table.render }
}