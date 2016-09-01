require 'cpf_faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

assessor_role = Role.create(name:"assessor",description:"Assessores",default:true)
personmanager_role = Role.create(name:"personmanager",description:"Gestor de pessoas")
disable_role = Role.create(name:"disable",description:"Desligados")
exclude_role = Role.create(name:"exclude",description:"Excluidos")

roles = [assessor_role,personmanager_role,disable_role,exclude_role]
password_load = YAML.load_file(Rails.root.to_s+"/config/secrets.yml")

admin_role = Role.create(name:"administrator",description:"Administrador do sistema")
require 'yaml'
User.create(email:"admin@zenitaerospace.com",
            password:password_load["user_admin"]["password"],
            role:admin_role)


NAME = %w[ Artur Marcelo Eduarda Ana ]
SURNAMES = %w[ Bersan Ferreira Martins ]
print "Create users: "
rg = 1111111
for name in NAME
  for surname in SURNAMES
    full_name = [name, surname].join(' ')
    email = full_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')+"@zenitaerospace.com"
    user = User.create(email:email,
                       password:password_load["common_user"]["password"],
                       role:roles.sample)
    personal_info = PersonalInformation.create(name: full_name,
                                               email: email,
                                               cpf: Faker::CPF.numeric,
                                               rg: rg,
                                               user: user)
    rg += 1
    print "."
  end
end
print "\n"
