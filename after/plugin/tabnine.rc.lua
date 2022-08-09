local status, tabnine = pcall(require, "cmp_tabnine.config")
if (not status) then return end

tabnine:setup({
    max_num_results = 5;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    };
    show_prediction_strength = false;
})
