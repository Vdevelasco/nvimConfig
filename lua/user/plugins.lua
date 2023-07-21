-- local bufferlist      = require('ide.components.bufferlist')
-- local explorer        = require('ide.components.explorer')
-- local outline         = require('ide.components.outline')
-- local callhierarchy   = require('ide.components.callhierarchy')
-- local timeline        = require('ide.components.timeline')
-- local terminal        = require('ide.components.terminal')
-- local terminalbrowser = require('ide.components.terminal.terminalbrowser')
-- local changes         = require('ide.components.changes')
-- local commits         = require('ide.components.commits')
-- local branches        = require('ide.components.branches')
-- local bookmarks       = require('ide.components.bookmarks')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Install your plugins here
require("lazy").setup({
  { "nvim-lua/plenary.nvim" }, -- lua functions b,y lots of plugins
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "kyazdani42/nvim-web-devicons" },
  { "kyazdani42/nvim-tree.lua" },
  {'romgrk/barbar.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  init = function() vim.g.barbar_auto_setup = false end,
  -- opts = {
  --   -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  --   -- animation = true,
  --   -- insert_at_start = true,
  --   -- …etc.
  -- },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
},
{ "moll/vim-bbye" },
{ "nvim-lualine/lualine.nvim" },
{ "akinsho/toggleterm.nvim" },
{ "ahmedkhalf/project.nvim" },
{ "lewis6991/impatient.nvim" },
{ "lukas-reineke/indent-blankline.nvim" },
{ "goolord/alpha-nvim" },
{ "folke/which-key.nvim" },

-- Colorschemes
{ "folke/tokyonight.nvim" },
{ "lunarvim/darkplus.nvim" },

-- Cmp
{ "hrsh7th/nvim-cmp" }, -- The completion plugin
{ "hrsh7th/cmp-buffer" }, -- buffer completions
{ "hrsh7th/cmp-path" }, -- path completions
{ "saadparwaiz1/cmp_luasnip" }, -- snippet completions
{ "hrsh7th/cmp-nvim-lsp" },
{ "hrsh7th/cmp-nvim-lua" },

-- Snippets
{ "L3MON4D3/LuaSnip" }, --snippet engine
{ "rafamadriz/friendly-snippets" }, -- a bunch of snippets to ,



-- LSP
{ "neovim/nvim-lspconfig" }, -- enable LSP
{ "williamboman/mason.nvim" }, -- simple to l,anguage server installer
{ "williamboman/mason-lspconfig.nvim" },
{ "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
{ "RRethy/vim-illuminate" },

-- Telescope
{ "nvim-telescope/telescope.nvim" },
{ "nvim-telescope/telescope-symbols.nvim", dependencies = {"telescope.nvim"} },
{ "nvim-telescope/telescope-dap.nvim", dependencies = {"telescope.nvim"} },

-- Treesitter
({
  "nvim-treesitter/nvim-treesitter",

}),

-- Git
{ "lewis6991/gitsigns.nvim" },

-- Registers
({
  "tversteeg/registers.nvim",
  config = function()
    require("registers").setup{}
  end,
}),

-- Session management plugin
{ "tpope/vim-obsession", cmd = "Obsession" },

{ "norcalli/nvim-colorizer.lua" },

-- Show undo history visually
{ "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } },

--DAP Nvim debugger --
{"mfussenegger/nvim-dap"}, --Debugger
{ "Weissle/persistent-breakpoints.nvim" }, --Breakpoints
"ofirgall/goto-breakpoints.nvim", --Saltar a breakpoints
{
  "andrewferrier/debugprint.nvim", --Hacer debug con prints
  config = function()
    require("debugprint").setup{}
  end,
},
{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup{}
  end,
},
{
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup{}
  end,
},
"neovim/nvim-lspconfig",

-- Others
"nanotee/zoxide.vim",
{ "booperlv/nvim-gomove" }, --Para duplicar y mover lineas de código
"krshrimali/nvim-autorunner",
{
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup{
      -- your configuration comes here
      -- or leave it empty to t,he default settings
      -- refer to the configuration section below
    }
  end,
},

"DougBeney/pickachu", --Color picker
"mattn/emmet-vim", --Emmet
"easymotion/vim-easymotion", --EasyMotion TODO: configurar
{
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup{}
  end,
},
{
  "phaazon/hop.nvim",
  branch = "v2", -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require("hop").setup{ keys = "etovxqpdygfblzhckisuran" }
  end,
},
"https://github.com/stefandtw/quickfix-reflector.vim", --Quickfixes stuff
"kuznetsss/shswitch", --Switch between header and classes
{
  "kylechui/nvim-surround", --Operate with surrounders, including html tags (mirar documentacion si nose acuerda)
  version = "*", -- f,or stability; omit to `,main` branch for the latest features
  config = function()
    require("nvim-surround").setup{
      -- Configuration here, or leave empty to d,efaults
    }
  end,
},
--ALE is also installed but not listed here, it was installed directly
--Hace uso de prettier eslint y otros embellecedores
-- Investigar como funciona LSP antes de andar con esta wea
-- ({
--     'ray-x/navigator.lua', --Para navegar mejor con una pantallita pequeña
--     dependencies = {
--         { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
--         { 'neovim/nvim-lspconfig' },
--     },
--     config = function()
--         require'navigator'.setup{}
--     end
-- }),
{
  "amrbashir/nvim-docs-view", -- Docs View for LSP
  opt = true,
  cmd = { "DocsViewToggle" },
  config = function()
    require("docs-view").setup{
      position = "right",
      width = 60,
    }
  end,
},
"gennaro-tedesco/nvim-peekup", --Mejor selector de registros, se usa con ""
{
  "cbochs/grapple.nvim", --Navegacion rapida a archivos (compleja, mirar documentacion, instalar vim 0.9?)
  dependencies = { "nvim-lua/plenary.nvim" },
},
"gaborvecsei/memento.nvim", --Ir a un archivo accedido anteriormente (mapear a leader key,
{
  "s1n7ax/nvim-search-and-replace", --Default mappings leader + g + r/R/u/U
  config = function()
    require("nvim-search-and-replace").setup{}
  end
},
-- ({
  --     "utilyre/barbecue.nvim", --Añade una barra de contexto (en que función o clase estamos)
  --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --         "SmiteshP/nvim-navic",
    --         "nvim-tree/nvim-web-devicons", -- optional dependency
    --     },
    --     after = "nvim-web-devicons", -- keep this if you're using NvChad
    --     config = function()
      --         require("barbecue").setup{}
      --     end,
      -- }),
      {
        "davidgranstrom/scnvim", -- Supercollider
        config = function()
          require("scnvim").setup{}
        end,
      },
      "ekickx/clipboard-image.nvim", -- Pegar Imagenes
      {
        "0styx0/abbreinder.nvim", --Avisa cuando usas algo para lo que ya existe un snippet (no se que engine usa)
        dependencies = {
          {
            "0styx0/abbremand.nvim",
            module = "abbremand", -- if want to lazy load
          },
        },
        config = function()
          -- config can be empty to stay with defaults
          -- or anything can be changed, with anything unspecified
          -- retaining the default values
          require("abbreinder").setup{}
        end,
        event = "BufRead", -- if want lazy load
      },
      {
        "nvim-orgmode/orgmode",
        config = function() --Otro orgmode (hay que configurar)
          require("orgmode").setup_ts_grammar()
          require("orgmode").setup{
            org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
            org_default_notes_file = "~/Dropbox/org/refile.org",
            mappings = {
              global = {
                org_agenda = "gA",
                org_capture = "gC",
              },
            },
          }
        end,
      },
      { "michaelb/sniprun", build = "bash ./install.sh" }, --Corre un chachito de código (No se si funciona con lenguajes compilados,, hay una repo de Arch para instalar si esto no funciona
      { "hkupty/iron.nvim" }, --Support para REPLs
      { "Olical/conjure"}, --Otro REPL (no se cual va mejor,
      {
        "mrjones2014/legendary.nvim", --Utilidad para nvim abreviaciones
        -- sqlite is only needed if you want to f,recency sorting
        -- dependencies = 'kkharji/sqlite.lua'
      },
      -- -- ({
      --     "Pocco81/auto-save.nvim", --Funcion de autoguardado
      --     config = function()
      --         require("auto-save").init {
      --             -- your config goes here
      --             -- or just leave it empty :D
      --         }
      --     end,
      -- }),
      -- ',nvim-treesitter/nvim-treesitter-context' -- Mete contexto? no se que hace exactamente
      {
        "rmagatti/auto-session", --ayuda para las sesiones
        config = function()
          require("auto-session").setup{
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
          }
        end,
      },
      "sindrets/winshift.nvim", --mover las ventanas más facilmente
      -- {
      --   "jgha/kitty-runner.nvim", --Mandar comandos a la terminal kitty
      -- },
      { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } }, --Interfaz para debugger
      {
        "ziontee113/color-picker.nvim",
        config = function()
          require("color-picker")
        end,
      },
      --     {
      --     'ldelossa/nvim-ide',
      --         require('ide').init({
      --     -- The global icon set to .,
      --     -- values: "nerd", "codicon", "default"
      --     icon_set = "default",
      --     -- Set the log level for nvim-ide's log. Log can be accessed with
      --     -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
      --     log_level = "info",
      --     -- Component specific configurations and default config overrides.
      --     components = {
      --         -- The global keymap is applied to all Components before construction.
      --         -- It allows common keymaps such as "hide" to be overridden, without having
      --         -- to make an override entry for all Components.
      --         --
      --         -- If a more specific keymap override is defined for a specific Component
      --         -- this takes precedence.
      --         global_keymaps = {
      --             -- example, change all Component's hide keymap to "h"
      --             -- hide = h
      --         },
      --         -- example, prefer "x" for hide only for Explorer component.
      --         -- Explorer = {
      --         --     keymaps = {
      --         --         hide = "x",
      --         --     }
      --         -- }
      --     },
      --     -- default panel groups to display on left and right.
      --     panels = {
      --         left = "explorer",
      --         right = "git"
      --     },
      --     -- panels defined by groups of components, i,s free to redefine the defaults
      --     -- and/or add additional.
      --     panel_groups = {
      --         explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
      --         terminal = { terminal.Name },
      --         git = { changes.Name, commits.Name, timeline.Name, branches.Name }
      --     },
      --     -- workspaces config
      --     workspaces = {
      --         -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
      --         auto_open = 'left',
      --     },
      --     -- default panel sizes for the different positions
      --     panel_sizes = {
      --         left = 30,
      --         right = 30,
      --         bottom = 15
      --     }
      -- })
      --     },
      "simrat39/rust-tools.nvim",
      "kevinhwang91/rnvimr",
      {
        "FeiyouG/command_center.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" }
      },
      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      'Mofiqul/vscode.nvim',
      ({
        "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup({
            -- optional configuration
          })
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
      }),
      {
        "luukvbaal/nnn.nvim",
        cmd = { "NnnPicker", "NnnExplorer" },
        config = function() require("nnn").setup({
          explorer = {
            cmd = "nnn", -- command overrride (-F1 flags are implied, -a flag is invalid!)
            width = 32, -- width of the vertical split
            session = "", -- or global/local/shared
            side = "topleft", -- or "botright", location of the explorer window
            tabs = true, -- seperate nnn instance per tab
            fullscreen = true, -- whether to fullscreen explorer window when current tab is empty
          },
          picker = {
            cmd = "nnn -od", -- command override (-p flag is implied)
            style = {
              width = 0.9, -- width in percentage of the viewport
              height = 0.8, -- height in percentage of the viewport
              xoffset = 0.5, -- xoffset in percentage
              yoffset = 0.5, -- yoffset in percentage
              border = "single", -- border decoration e.g. "rounded"(:h nvim_open_win)
            },
            session = "", -- or global/local/shared
            fullscreen = true, -- whether to fullscreen picker window when current tab is empty
          },
          auto_open = {
            setup = nil, -- or "explorer" / "picker", auto open on setup function
            tabpage = nil, -- or "explorer" / "picker", auto open when opening new tabpage
            empty = false, -- only auto open on empty buffer
            ft_ignore = { -- dont auto open for these filetypes
            "gitcommit",
          },
        },
        auto_close = false, -- close tabpage/nvim when nnn is last window
        replace_netrw = "picker",
        mappings = {
          { "<C-t>", require("nnn").builtin.open_in_tab }, -- open file(s) in tab
          { "<C-s>", require("nnn").builtin.open_in_split }, -- open file(s) in split
          { "<C-v>", require("nnn").builtin.open_in_vsplit }, -- open file(s) in vertical split
          { "<C-p>", require("nnn").builtin.open_in_preview }, -- open file in preview split keeping nnn focused
          { "<C-y>", require("nnn").builtin.copy_to_clipboard }, -- copy file(s) to clipboard
          { "<C-w>", require("nnn").builtin.cd_to_path }, -- cd to file directory
          { "<C-e>", require("nnn").builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
        },
        windownav = { -- window movement mappings to navigate out of nnn
        left = "<C-w>h",
        right = "<C-w>l",
        next = "<C-w>w",
        prev = "<C-w>W",
      },
      buflisted = false, -- whether or not nnn buffers show up in the bufferlist
      quitcd = "tcd", -- or "cd" / "lcd", command to run if quitcd file is found
      offset = false, -- whether or not to write position offset to tmpfile(for use in preview-tui)
    }) end
  },
  -- {
  --   "gelguy/wilder.nvim",
  --   enabled = true,
  --   config = function()
  --     local wilder = require('wilder')
  --     wilder.setup({modes = {':'}})
  --     wilder.set_option('renderer', wilder.popupmenu_renderer({
  --       pumblend = 0,
  --     }))
  --     wilder.set_option('renderer', wilder.popupmenu_renderer({
  --       highlighter = wilder.basic_highlighter(),
  --       left = {' ', wilder.popupmenu_devicons()},
  --       right = {' ', wilder.popupmenu_scrollbar()},
  --     }))
  --   end,
  -- },
  {
    "gelguy/wilder.nvim",
    lazy = true,
    event = "CmdlineEnter", -- 懒加载：首次进入cmdline时载入
    config = function()
      local wilder = require("wilder")
      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = 0,
        previous_key = 0,
        reject_key = 0,
        accept_key = 0,
      })
      vim.api.nvim_command("silent! UpdateRemotePlugins") -- 需要载入一次py依赖 不然模糊过滤等失效
      -- 设置source
      wilder.set_option("pipeline", {
        wilder.branch(
        -- 当默认无输入时 展示15条历史记录
        {
          wilder.check(function(_, x)
            return vim.fn.empty(x)
          end),
          wilder.history(10),
        },
        -- 当输入时 展示所有匹配项(模糊匹配)
        wilder.cmdline_pipeline({
          fuzzy = 1,
          set_pcre2_pattern = 1,
          fuzzy_filter = wilder.vim_fuzzy_filter(),
        }),
        wilder.python_search_pipeline({
          pattern = "fuzzy",
        }),
        -- pipeline for search
        wilder.search_pipeline()
        ),
      })
      wilder.setup({modes = {':'}})
      wilder.set_option('renderer', wilder.popupmenu_renderer({
        pumblend = 0,
      }))
      wilder.set_option('renderer', wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()},
      }))
    end,
  },
  {
    'ziontee113/color-picker.nvim',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      require 'color-picker'
    end,
    cmd = 'PickColorInsert',
  },
  {
    'lambdalisue/suda.vim'
  },
  {
    "folke/todo-comments.nvim",
    require = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'nyngwang/nvimgelion',
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      {"kyazdani42/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
  },
  {
    'folke/trouble.nvim',
  },
  {
    'zubairakram/nvim-emmet',
  },
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
},
  { "rafamadriz/friendly-snippets" }
})
