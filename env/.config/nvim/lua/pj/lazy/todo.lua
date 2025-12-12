return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        keywords = {
            FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
            PERF = { icon = " ", color = "default" },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },

        highlight = {
            before = "",
            keyword = "bg",
            after = "fg",
            pattern = [[.*<(KEYWORDS)\s*]],
        },
        search = {
            pattern = [[\b(KEYWORDS)\b\W]],
        },

        colors = {
            error = "#F44747",
            warning = "#ff8800",
            info = "#4FC1FF",
            hint = "#10B981",
            default = "#7C3AED",
            test = "#FF00FF",
        },
    },
}
