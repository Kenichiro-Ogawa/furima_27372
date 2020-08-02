Rails.application..config.to_prepare do
  Category.reload
end