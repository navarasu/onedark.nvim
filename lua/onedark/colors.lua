local colors = {
        black = { '#17191e', '#0e1013' , '#151820' , '#191a1c' , '#0c0e15' },
          bg0 = { '#282c34', '#1f2329' , '#242b38' , '#2c2d30' , '#1a212e' },
          bg1 = { '#31353f', '#282c34' , '#2d3343' , '#35373b' , '#21283b' },
          bg2 = { '#393f4a', '#30363f' , '#343e4f' , '#3e4045' , '#283347' },
          bg3 = { '#646e82', '#5b6577' , '#5b6b8b' , '#6d7179' , '#4b5f87' },
         bg_d = { '#21252b', '#181b20' , '#1e242e' , '#242628' , '#141b24' },
      bg_blue = { '#73b8f1', '#61afef' , '#6db9f7' , '#79b7eb' , '#54b0fd' },
    bg_yellow = { '#ebd09c', '#e8c88c' , '#f0d197' , '#e6cfa1' , '#f2cc81' },
           fg = { '#abb2bf', '#a0a8b7' , '#a5b0c5' , '#b1b4b9' , '#93a4c3' },
       purple = { '#c678dd', '#bf68d9' , '#ca72e4' , '#c27fd7' , '#c75ae8' },
        green = { '#98c379', '#8ebd6b' , '#97ca72' , '#99bc80' , '#8bcd5b' },
       orange = { '#d19a66', '#cc9057' , '#d99a5e' , '#c99a6e' , '#dd9046' },
         blue = { '#61afef', '#4fa6ed' , '#5ab0f6' , '#68aee8' , '#41a7fc' },
       yellow = { '#e5c07b', '#e2b86b' , '#ebc275' , '#dfbe81' , '#efbd5d' },
         cyan = { '#56b6c2', '#48b0bd' , '#4dbdcb' , '#5fafb9' , '#34bfd0' },
          red = { '#e86671', '#e55561' , '#ef5f6b' , '#e16d77' , '#f65866' },
         grey = { '#5c6370', '#535965' , '#546178' , '#646568' , '#455574' },
         none = { 'NONE', 'NONE' , 'NONE', 'NONE' , 'NONE' },
    dark_cyan = { '#2b6f77', '#266269' , '#25747d' , '#316a71' , '#1b6a73' },
     dark_red = { '#993939', '#8b3434' , '#a13131' , '#914141' , '#992525' },
  dark_yellow = { '#93691d', '#835d1a' , '#9a6b16' , '#8c6724' , '#8f610d' },
  dark_purple = { '#8a3fa0', '#7e3992' , '#8f36a9', '#854897' , '#862aa1' },
     diff_red = { '#773440', '#773440' , '#773440' , '#773440' , '#773440' }, --
   diff_green = { '#587738', '#587738' , '#587738' , '#587738' , '#587738' }, --
    diff_blue = { '#354A77', '#354A77' , '#354A77' , '#354A77' , '#354A77' }, --
    diff_add =  { '#1E2326', '#1E2326' , '#1E2326' , '#1E2326' , '#1E2326' }, --
  diff_change = { '#262b3d', '#262b3d' , '#262b3d' , '#262b3d' , '#262b3d' }, --
  diff_delete = { '#281B27', '#281B27' , '#281B27' , '#281B27' , '#281B27' }  --
}

local styles = { dark = 1, darker = 2 , cool = 3, warm = 4, deep = 5}

local function select_colors()
    index = styles[vim.g.onedark_style]
    local selected = {}
    for k, v in pairs(colors) do selected[k] = v[index] end
    return selected
end

return select_colors()
