module Selectors
  def txt_fld(name, selector_type, value)
    @name = {"selector" => selector_type, "value"=> value}
    return @name
  end
end