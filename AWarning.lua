script_name('AWarning')
script_author('nede7u')
script_properties('work-in-pause')

require("lib.moonloader")
sampev = require('samp.events')

function main()
  if not isSampLoaded() or not isSampfuncsLoaded() then return end
  while not isSampAvailable() do wait(100) end

  sampRegisterChatCommand("gowarning", function()
    if id == nil then 
      sampAddChatMessage("{E78284}[AWarning] {84A6E7}Подозреваемый вышел из игры!", -1) 
      return 
    end
    sampSendChat(string.format("/re %s", id))
    sampSendChat(string.format("/a [AWarning] Начал слежку за потенциальным читером %s[%s].", nick, id))
  end)

  sampRegisterChatCommand("notsoft", function()
    if id == nil then 
      sampAddChatMessage("{E78284}[AWarning] {84A6E7}Подозреваемый вышел из игры!", -1) 
      return 
    end
    sampSendChat(string.format("/a [AWarning] Нарушений от %s[%s] не обнаружено.", nick, id))
  end)

  sampAddChatMessage("{E78284}[AWarning] {84A6E7}Скрипт успешно запущен. Автор: {E78284}nede7u", -1)

  while true do
    wait(0)
  end
end

function sampev.onServerMessage(color, text)
  if text:find("<Warning> (.*)%[(.*)%]: Возможно") then
    nick, id = text:match("<Warning> (.*)%[(.*)%]: Возможно")
  end
end