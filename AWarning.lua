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
      sampAddChatMessage("{E78284}[AWarning] {84A6E7}������������� ����� �� ����!", -1) 
      return 
    end
    sampSendChat(string.format("/re %s", id))
    sampSendChat(string.format("/a [AWarning] ����� ������ �� ������������� ������� %s[%s].", nick, id))
  end)

  sampRegisterChatCommand("notsoft", function()
    if id == nil then 
      sampAddChatMessage("{E78284}[AWarning] {84A6E7}������������� ����� �� ����!", -1) 
      return 
    end
    sampSendChat(string.format("/a [AWarning] ��������� �� %s[%s] �� ����������.", nick, id))
  end)

  sampAddChatMessage("{E78284}[AWarning] {84A6E7}������ ������� �������. �����: {E78284}nede7u", -1)

  while true do
    wait(0)
  end
end

function sampev.onServerMessage(color, text)
  if text:find("<Warning> (.*)%[(.*)%]: ��������") then
    nick, id = text:match("<Warning> (.*)%[(.*)%]: ��������")
  end
end