# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name:"exclude",description:"Excluidos")
Role.create(name:"disable",description:"Desligados")
Role.create(name:"assessor",description:"Assessores")
Role.create(name:"personmanager",description:"Gestor de pessoas")

admin_role = Role.create(name:"administrator",description:"Administrador do sistema")
require 'yaml'
password_load = YAML.load_file(Rails.root.to_s+"/config/secrets.yml")
User.create(email:"admin@zenitaerospace.com",
            password:password_load["user_admin"]["password"],
            role:admin_role)
