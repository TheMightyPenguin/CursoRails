class Address < ActiveRecord::Base

  belongs_to :person
  
  #Si no sigo las convenciones
    
  #self.table.name = "direccion"
  #belongs_to :owner, class_name: "Person", foreign_key: "person_id"
end
