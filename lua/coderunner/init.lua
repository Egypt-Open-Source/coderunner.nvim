local M = {}

local cpp = function(file)
    local command = ':call jobsend(b:terminal_job_id, "g++ ' .. file .. '\\n")'
    vim.cmd(command)
    local runcomm = ':call jobsend(b:terminal_job_id, "./a.out \\n")'
    vim.cmd(runcomm)
end

local py = function(file)
    local command = ':call jobsend(b:terminal_job_id, "python ' .. file .. '\\n")'
    vim.cmd(command)
end

M.run = function()
    local file = vim.fn.expand("%:p")
    local extension = file:match("([^.]+)$")

    -- Main process
    if file == "" then
        print("CodeRunner: Error: Not supported file type")
    elseif extension then
        small_extension = extension:lower()
        vim.cmd("split | terminal")
        if extension == "cpp" or extension:lower() == "c" then
            cpp(file)
        elseif extension == "py" then
            py(file)
        else
            print("CodeRunner: Error: Not supported file type")
        end
    end
end

return M
