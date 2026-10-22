local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

local cmd = { "jdtls" }
if vim.uv.fs_stat(lombok_path) then
  table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_path))
end

return {
  cmd = cmd,
}
