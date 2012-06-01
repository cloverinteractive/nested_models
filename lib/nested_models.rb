require 'nested_models/engine'
require 'nested_models/form_helper'

module NestedModels
end

class ActionController::Base
  self.helper NestedModels::FormHelper
end
