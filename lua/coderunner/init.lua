local M = {}

local cpp = function(file)
    local command = ':call jobsend(b:terminal_job_id, "g++ ' .. file .. '\\n")'
    vim.cmd(command)
    local runcomm = ':call jobsend(b:terminal_job_id, "./a.out \\n")'
    vim.cmd(runcomm)
    vim.cmd(':call jobsend(b:terminal_job_id, "rm -rf a.out \\n")')
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
        local small_extension = extension:lower()
        if small_extension == "cpp" or small_extension == "c" then
            vim.cmd("split | terminal")
            cpp(file)
        elseif small_extension == "py" then
            vim.cmd("split | terminal")
            py(file)
        else
            print("CodeRunner: Error: Not supported file type")
        end
    end
end

return M
