local options = {
	encoding = 'utf-8',
	number = true,
	showcmd = true,
	showmode = false,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	hidden = true, -- avoid having to write changes before editing another buffer 
	autoindent = true,
	smartcase = true,-- override the ignorecase option if the search contains any uppercase character
	ignorecase = true,-- avoid having to write changes before editing another buffer
	gdefault = true,-- appends "g" when replacing
	incsearch = true,
	hlsearch = true,
	cursorline = true
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
