local CodeRunner = {}

function CodeRunner:cpp(file)
    local command = ':call jobsend(b:terminal_job_id, "g++ ' .. file .. '\\n")'
    vim.cmd(command)
    local runcomm = ':call jobsend(b:terminal_job_id, "./a.out \\n")'
    vim.cmd(runcomm)
end

function CodeRunner:py(file)
    local command = ':call jobsend(b:terminal_job_id, "python ' .. file .. '\\n")'
    vim.cmd(command)
end

function CodeRunner:run()
    local file = vim.fn.expand("%:p")
    local extension = file:match("([^.]+)$")

    -- Main process
    if file == "" then
        print("CodeRunner: Error: Not supported file type")
    elseif extension then
        local small_extension = extension:lower()
        if small_extension == ("cpp" or "c") then
            vim.cmd("split | terminal")
            self:cpp(file)
        elseif small_extension == "py" then
            vim.cmd("split | terminal")
            self:py(file)
        else
            print("CodeRunner: Error: Not supported file type")
        end
    end
end

return CodeRunner
