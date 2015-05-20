module Dates

  class DateValidator < ActiveModel::Validator
    def validate(record)

      unless record.start_date.class == Date
        record.errors[:start_date] << 'Start date is not a date!'
      end

      unless record.end_date.class == Date
        record.errors[:end_date] << 'End date is not a date!'
      end

      if record.start_date < Date.today
        record.errors[:start_date] << 'Start date is in the past!'
      end

      if record.end_date < record.start_date
        record.errors[:end_date] << 'End date is before start date'
      end

    end
  end

end