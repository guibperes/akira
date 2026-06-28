for i = 1, 5 do
  hl.workspace_rule({ workspace = tostring(i), monitor = "desc:LG Electronics 27GN7 0x00008E27" })
end

for i = 6, 10 do
  local workspace = i % 10
  hl.workspace_rule({ workspace = tostring(workspace), monitor = "desc:AOC 2460G5 0x00000B61" })
end
