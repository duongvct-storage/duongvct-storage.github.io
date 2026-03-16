local Date = require "filters.lib.date"
local fs   = require "filters.lib.fs"
local core = require "filters.lib.core"

local function getfilename(path)
  local fname = pandoc.path.split_extension(pandoc.path.split_extension(pandoc.path.filename(path)))
  return fname
end

local function json_escape(s)
  if s == nil then return "" end
  return s:gsub("\\", "\\\\"):gsub("\"", "\\\""):gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t")
end

local function extract_strings(xs)
  if xs == nil then return {} end
  if pandoc.utils.type(xs) ~= "List" then
    xs = pandoc.List({xs})
  end
  return xs:map(function(s)
    return json_escape(pandoc.utils.stringify(s):gsub("%s+", "-"):lower())
  end)
end

function Meta(m)
  local dirs = {"posts", "school"}
  local all_items = {}

  for _, dir in ipairs(dirs) do
    local postdir = "content/" .. dir
    local ok, posts = pcall(pandoc.system.list_directory, postdir)
    
    if ok and posts then
      for _, post in ipairs(posts) do
        -- Only process markdown files
        if post:match("%.md$") or post:match("%.md%.lhs$") then
          local path = pandoc.path.join{postdir, post}
          local ok_meta, meta = pcall(fs.read_metadata, path)
          
          if ok_meta and meta and meta.title then
            local date_str = ""
            local ok_date, date_obj = pcall(Date, meta.date)
            if ok_date and date_obj then
              date_str = date_obj:string(".")
            end

            table.insert(all_items, {
              title       = json_escape(pandoc.utils.stringify(meta.title or "")),
              href        = json_escape(string.format("/%s/%s/", dir, getfilename(post))),
              date        = json_escape(date_str),
              themes      = extract_strings(meta.theme),
              keywords    = extract_strings(meta.keywords),
              description = json_escape(pandoc.utils.stringify(meta.description or "")),
              type        = json_escape(dir)
            })
          end
        end
      end
    end
  end

  -- Sort by date descending (handle empty dates)
  table.sort(all_items, function(a, b) 
    if a.date == "" then return false end
    if b.date == "" then return true end
    return a.date > b.date 
  end)

  m.search_index = all_items
  return m
end
