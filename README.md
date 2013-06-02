# Kimkëlen cookbook

Instala Kimkëlen considerando DB mysql, apache y el producto en si

## Usando Vagrant para probarlo rápidamente

Para probar el producto en forma rápida, sugerimos:

* Instalar [Vagrant](http://www.vagrantup.com) siguiendo las instrucciones del
  producto

* Instalar el plugin de Berkshelf 

```
vagrant plugin install vagrant-berkshelf
```

* Clonar este repo

```
git clone https://github.com/Desarrollo-CeSPI/kimkelen_cookbook.git
```

* Iniciar la máquina virtual
```
cd kimkelen_cookbook
vagrant up
```

* Probarlo en un navegador ingresando a:

  * Acceder a: http://33.33.33.12
    * El usuario y contraseña por defecto son los especificados en el [README de
      kimkelen](https://github.com/Desarrollo-CeSPI/kimkelen#atributos)

>La dirección ip puede cambiarse editando Vagrantfile

Se provee además un ejemplo de Vagrantfile para utilizar kimkelen en Amazon EC2

# Requerimientos

Este cookbook utiliza, y por tanto depende de los siguientes cookbooks:

* apt
* apache2
* php
* mysql
* database

# Uso

Solo tiene una receta: `default` que hace todo

# Atributos

Los atributos a cambiar son:

```ruby
default[:kimkelen][:flavor] = "demo"

default[:kimkelen][:www][:server_name] = nil #Asume hostname
default[:kimkelen][:www][:server_alias] = nil 
default[:kimkelen][:www][:mail] = "example@kimkelen.edu"

default[:kimkelen][:database][:name] = "kimkelen"
default[:kimkelen][:database][:user] = "kimkelen"
default[:kimkelen][:database][:password] = "kimkelen_pass"
default[:kimkelen][:path] = "/opt/kimkelen"
default[:kimkelen][:git_repository] = "https://github.com/Desarrollo-CeSPI/kimkelen.git"
default[:kimkelen][:git_revision] = "master"
```
# Autor

Author:: Christian A. Rodriguez(<car@cespi.unlp.edu.ar>)
