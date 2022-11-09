class ApplicationModel
  def self.has_many(*args)
    define_method args[0].to_sym do 
      klass = args[0][0,4]
      klass = Object.const_get(klass.capitalize)
      ObjectSpace.each_object(klass).to_a.reverse.select {|x| x.order_id == self.object_id }
    end
  end
end
