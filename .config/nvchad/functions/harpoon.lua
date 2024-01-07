--local harpoon = require("harpoon")
--local conf = require("telescope.config").values

local M = {
  append = function()
    harpoon:list():append()
  end,
  select = function(index)
    harpoon:list():select(index)
  end,
  prev = function()
    harpoon:list():prev()
  end,
  next = function()
    harpoon:list():next()
  end,
  clear = function()
    harpoon:list():clear()
  end,
  remove = function(buf)
    harpoon:list():remove(buf)
  end,

  toggle_telescope = function()
    local file_paths = {}
    for _, item in ipairs(harpoon:list()) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end,
}

return M
