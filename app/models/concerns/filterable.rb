module Filterable
  extend ActiveSupport::Concern

  module ClassMethods


    def filter(filter_params)
      results = self.all
      filter_params(params).each do |search, result|
        results = results.public_send(search, result) if result.present?
      end
      results
    end


  end

end