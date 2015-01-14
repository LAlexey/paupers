class FormObject
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persist
    raise NotImplementedError
  end

  def persist!
    raise 'form object with errors' unless persist
  end

  def persisted?
    false
  end
end
