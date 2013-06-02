web_app "kimkelen" do
  admin_mail node.kimkelen.www.mail
  server_name node.kimkelen.www.server_name
  server_alias node.kimkelen.www.server_alias
  doc_root "#{node.kimkelen.path}/current/web"
end

template "#{node['php']['conf_dir']}/../apache2/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  cookbook 'php'
  notifies :restart, "service[apache2]"
end

