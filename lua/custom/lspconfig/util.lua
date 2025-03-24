local M = {}

--- @return string
--- @param buffer number
function M.get_root_dir(buffer)
  local file_name = vim.api.nvim_buf_get_name(buffer)

  if file_name:sub(-#'csx') == 'csx' then
    print(file_name:match '.*/')
    return file_name:match '.*/'
  end

  local root_dir = vim.fn.systemlist('fd -e sln . ' .. vim.loop.cwd())[1]

  if root_dir == nil then
    root_dir = vim.loop.cwd()
  end

  print(root_dir)

  return root_dir
end

return M
