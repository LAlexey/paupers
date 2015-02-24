class FormObject
  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persist(record=nil)
    raise NotImplementedError
  end

  def persist!(record=nil)
    raise 'form object with errors' unless persist(record)
  end

  def persisted?
    false
  end
end
