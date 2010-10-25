# -*- coding: utf-8 -*-
module Classes

  class Ingred_data

    def initialize(ingred_id, amount, unit_id)
      @ingred_id = ingred_id
      @unit_id = unit_id
      @amount = amount
      @weights = ["g", "kg", "Msp.", "Pr.", "TL", "EL"]
      @volumes = ["ml", "Liter", "l", "cl", "dl"]
    end #end initialize


    def ingred
      Ingred.find(@ingred_id).name
    end #end ingred


    def ingred_id
      @ingred_id
    end #end ingred_id


    def amount
      @amount
    end #end amount


    def unit_id
      @unit_id
    end #end unit_id


    def unit
      Unit.find(@unit_id).name
    end #end unit


    def ingredtype_name
      Ingredtype.find(Ingred.find(@ingred_id).ingredtype_id).name
    end #end ingredtype


    def ingredtype_id
      Ingredtype.find(Ingred.find(@ingred_id).ingredtype_id).id
    end #end ingredtype


    def add(amount, unit_id)
      indicator = false
      unit_name = Unit.find(unit_id).name
      if @weights.include? unit_name
        converted_weight = Unit.convert_weights(amount, unit_name)
        @amount += converted_weight.at(0)
        @unit_id = converted_weight.at(1)
        indicator = true
      else
        if @volumes.include? unit_name
          converted_volume = Unit.convert_volumes(amount, unit_name)
          @amount += converted_volume.at(0)
          @unit_id = converted_volume.at(1)
          indicator = true
        else
          if unit_id == @unit_id
            @amount += amount
            indicator = true
          end
        end
      end
      return indicator
    end #end


  end #end class Ingred_data

end #end module classes
