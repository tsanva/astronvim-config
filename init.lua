return {
  plugins = {
    {
      "kepano/flexoki-neovim",
      name = "flexoki",
    },
  },
  polish = function()
    local group = vim.api.nvim_create_augroup("__env", {clear=true})
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*.env",
      group = group,
      callback = function(args)
        vim.diagnostic.disable(args.buf)
      end
    })
    vim.cmd('colorscheme flexoki-dark')
    vim.opt.clipboard = "unnamedplus"
    if vim.fn.has('wsl') == 1 then
      vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
          vim.fn.system('clip.exe', vim.fn.getreg('"'))
      end,
      })
    end
  end,
}
