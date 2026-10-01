-- GoogleBar: codifica la consulta y abre la busqueda en el navegador

function Initialize()
end

local function urlencode(s)
  s = s:gsub('([^%w%-%_%.%~ ])', function(c)
    return string.format('%%%02X', string.byte(c))
  end)
  s = s:gsub(' ', '+')
  return s
end

function Search()
  local q = SKIN:GetVariable('Query', '') or ''
  q = q:gsub('^%s+', '')
  q = q:gsub('%s+$', '')
  if q == '' then return end
  SKIN:Bang('["https://www.google.com/search?q=' .. urlencode(q) .. '"]')
  SKIN:Bang('!SetVariable', 'Query', '')
end
