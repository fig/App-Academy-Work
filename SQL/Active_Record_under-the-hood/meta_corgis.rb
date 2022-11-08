require 'byebug'

class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks
  attr_reader :box_id, :snack_box

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def method_missing(name)
    meta_corgi_snack = MetaCorgiSnacks.new(@snack_box, @box_id)
    meta_corgi_snack.method_missing(name)
  end 
end


class MetaCorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  # def method_missing(name, *args)
  #   if name == :bone
  #     info = @snack_box.send(:get_bone_info, @box_id)
  #     tastiness = @snack_box.send(:get_bone_tastiness, @box_id)
  #   elsif name == :kibble
  #     info = @snack_box.send(:get_kibble_info, @box_id)
  #     tastiness = @snack_box.send(:get_kibble_tastiness, @box_id)
  #   elsif name == :treat
  #     info = @snack_box.send(:get_treat_info, @box_id)
  #     tastiness = @snack_box.send(:get_treat_tastiness, @box_id)
  #   end 
  #   result = "#{name.to_s.capitalize}: #{info}: #{tastiness} "
  #   tastiness > 30 ? "* #{result}" : result
  # end

  def self.define_snack(name)

    define_method(name) do 
      corgi_snack_box = CorgiSnacks.new(@snack_box, @box_id)
      if name == 'bone'
        info = corgi_snack_box.snack_box.send(:get_bone_info, corgi_snack_box.box_id)
        tastiness = corgi_snack_box.snack_box.send(:get_bone_tastiness, corgi_snack_box.box_id)
      elsif name == 'kibble'
        info = corgi_snack_box.snack_box.send(:get_kibble_info, corgi_snack_box.box_id)
        tastiness = corgi_snack_box.snack_box.send(:get_kibble_tastiness, corgi_snack_box.box_id)
      elsif name == 'treat'
        info = corgi_snack_box.snack_box.send(:get_treat_info, corgi_snack_box.box_id)
        tastiness = corgi_snack_box.snack_box.send(:get_treat_tastiness, corgi_snack_box.box_id)
      end 
      result = "#{name.to_s.capitalize}: #{info}: #{tastiness} "
      tastiness > 30 ? "* #{result}" : result
    end   
  end

end
