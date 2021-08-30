local colors = {
        black = { '#17191e', '#0e1013' , '#151820' , '#0c0e15' , '#191a1c' , '#101012' },
          bg0 = { '#282c34', '#1f2329' , '#242b38' , '#1a212e' , '#2c2d30' , '#232326' },
          bg1 = { '#31353f', '#282c34' , '#2d3343' , '#21283b' , '#35373b' , '#2c2d31' },
          bg2 = { '#393f4a', '#30363f' , '#343e4f' , '#283347' , '#3e4045' , '#35363b' },
          bg3 = { '#3b3f4c', '#323641' , '#363c51' , '#2a324a' , '#404247' , '#37383d' },
         bg_d = { '#21252b', '#181b20' , '#1e242e' , '#141b24' , '#242628' , '#1b1c1e' },
      bg_blue = { '#73b8f1', '#61afef' , '#6db9f7' , '#54b0fd' , '#79b7eb' , '#68aee8' },
    bg_yellow = { '#ebd09c', '#e8c88c' , '#f0d197' , '#f2cc81' , '#e6cfa1' , '#e2c792' },
           fg = { '#abb2bf', '#a0a8b7' , '#a5b0c5' , '#93a4c3' , '#b1b4b9' , '#a7aab0' },
       purple = { '#c678dd', '#bf68d9' , '#ca72e4' , '#c75ae8' , '#c27fd7' , '#bb70d2' },
        green = { '#98c379', '#8ebd6b' , '#97ca72' , '#8bcd5b' , '#99bc80' , '#8fb573' },
       orange = { '#d19a66', '#cc9057' , '#d99a5e' , '#dd9046' , '#c99a6e' , '#c49060' },
         blue = { '#61afef', '#4fa6ed' , '#5ab0f6' , '#41a7fc' , '#68aee8' , '#57a5e5' },
       yellow = { '#e5c07b', '#e2b86b' , '#ebc275' , '#efbd5d' , '#dfbe81' , '#dbb671' },
         cyan = { '#56b6c2', '#48b0bd' , '#4dbdcb' , '#34bfd0' , '#5fafb9' , '#51a8b3' },
          red = { '#e86671', '#e55561' , '#ef5f6b' , '#f65866' , '#e16d77' , '#de5d68' },
         grey = { '#5c6370', '#535965' , '#546178' , '#455574' , '#646568' , '#5a5b5e' },
   light_grey = { '#848b98', '#7a818e' , '#7d899f' , '#6c7d9c' , '#8b8d91' , '#818387' },
    dark_cyan = { '#2b6f77', '#266269' , '#25747d' , '#1b6a73' , '#316a71' , '#2b5d63' },
     dark_red = { '#993939', '#8b3434' , '#a13131' , '#992525' , '#914141' , '#833b3b' },
  dark_yellow = { '#93691d', '#835d1a' , '#9a6b16' , '#8f610d' , '#8c6724' , '#7c5c20' },
  dark_purple = { '#8a3fa0', '#7e3992' , '#8f36a9' , '#862aa1' , '#854897' , '#79428a' },
    diff_add =  { '#31392b', '#272e23' , '#303d27' , '#27341c' , '#32352f' , '#282b26' },
  diff_delete = { '#382b2c', '#2d2223' , '#3c2729' , '#331c1e' , '#342f2f' , '#2a2626' },
  diff_change = { '#1c3448', '#172a3a' , '#18344c' , '#102b40' , '#203444' , '#1a2a37' },
    diff_text = { '#2c5372', '#274964' , '#265478' , '#1c4a6e' , '#32526c' , '#2c485f' }
}


local styles = { dark = 1, darker = 2 , cool = 3, deep = 4, warm=5, warmer =6 }

local function select_colors()
    local index = styles[vim.g.onedark_style]
    local selected = {}
    for k, v in pairs(colors) do selected[k] = v[index] end
		selected['none'] = 'NONE'
    return selected
end

return select_colors()
