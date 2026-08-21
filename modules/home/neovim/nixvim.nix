# Neovim configuration managed using https://github.com/nix-community/nixvim
{
  # Use the terminal's clipboard when Neovim is running over SSH. This lets
  # yanks reach the client machine without requiring xclip/wl-copy on the
  # server.
  extraConfigLua = ''
    if vim.env.SSH_TTY then
      local osc52 = require("vim.ui.clipboard.osc52")
      vim.g.clipboard = {
        name = "OSC 52",
        copy = {
          ["+"] = osc52.copy("+"),
          ["*"] = osc52.copy("*"),
        },
        paste = {
          ["+"] = osc52.paste("+"),
          ["*"] = osc52.paste("*"),
        },
      }
    end
  '';

  # Theme
  colorschemes.gruvbox.enable = true;

  # Settings
  opts = {
    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    number = true;
    clipboard = "unnamedplus";
  };

  # Keymaps
  globals = {
    mapleader = " ";
  };

  plugins = {

    # UI
    web-devicons.enable = true;
    lualine.enable = true;
    bufferline.enable = true;
    treesitter = {
  enable = true;
  ensureInstalled = [
    "lua"
    "vim"
    "vimdoc"
    "bash"
    "json"
    "yaml"
    "toml"
    "markdown"
    "nix"
  ];
};

    which-key = {
      enable = true;
    };
    noice = {
      # WARNING: This is considered experimental feature, but provides nice UX
      enable = true;
      settings.presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
      };
    };
    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = {
          options.desc = "file finder";
          action = "find_files";
        };
        "<leader>fg" = {
          options.desc = "find via grep";
          action = "live_grep";
        };
      };
      extensions = {
        file-browser.enable = true;
      };
    };

    lazygit.enable = true;
  };
  keymaps = [
    # Ghostty sends Ctrl-C for Cmd-C when there is no terminal selection.
    # In Visual mode, copy Neovim's selection to the system clipboard.
    {
      mode = "v";
      key = "<C-c>";
      action = ''"+y'';
      options.desc = "Copy selection to clipboard";
    }

    # Open lazygit within nvim. 
    {
      action = "<cmd>LazyGit<CR>";
      key = "<leader>gg";
    }
  ];
}
