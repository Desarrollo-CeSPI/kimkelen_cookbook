directory node.kimkelen.path do
  owner node.apache.user
  group node.apache.group
  mode "0755"
  action :create
end

%w( shared
    shared/config
    shared/log).each do |dir|
  directory "#{node.kimkelen.path}/#{dir}" do
    owner node.apache.user
    group node.apache.group
    recursive true
    mode "0755"
    action :create
  end
end

%w( config/databases.yml
    config/propel.ini).each do |file|
  template "#{node.kimkelen.path}/shared/#{file}" do
    source "#{file}.erb"
    owner node.apache.user
    group node.apache.group
  end
end


deploy node.kimkelen.path do
  migrate true
  migration_command <<-EOF
    php symfony kimkelen:flavor #{node.kimkelen.flavor}
    php symfony propel:build-all-load --no-confirmation
    php symfony plugin:publish
    php symfony project:permissions
    php symfony clear-cache
  EOF
  user node.apache.user
  group node.apache.group
  repository node.kimkelen.git_repository
  revision node.kimkelen.git_revision
  symlink_before_migrate ({
    "config/databases.yml"  => "config/databases.yml",
    "config/propel.ini"     => "config/propel.ini",
    "log"                   => "log"
  })
end
