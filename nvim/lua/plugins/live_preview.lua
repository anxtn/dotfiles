require("livepreview.config").set({
    picker = "telescope",
    sync_scroll = true,
})

-- <leader>mp toggles the browser preview (KaTeX math + mermaid) for markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.keymap.set("n", "<leader>mp", function()
            if require("livepreview").is_running() then
                vim.cmd("LivePreview close")
            else
                vim.cmd("LivePreview start")
            end
        end, { buffer = args.buf, desc = "Toggle markdown live preview" })
    end,
})
