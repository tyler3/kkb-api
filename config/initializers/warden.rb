# この設定がないとcookieがオーバーフローしてエラーになる
Warden::Manager.serialize_into_session do |record|
  [record.to_key, record.authenticatable_salt]
end

Warden::Manager.serialize_from_session do |key, salt|
  record = to_adapter.get(key)
  record if record && record.authenticatable_salt == salt
end
