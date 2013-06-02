include_recipe "apt::default" if platform_family?('ubuntu')
include_recipe "apache2::mod_php5"
include_recipe "php::module_apc"
include_recipe "php::module_mysql"
package "git"
package "php5-xsl"
