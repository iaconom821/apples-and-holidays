require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies = ""
  holiday_hash.each do |season, holiday| 
    holiday.each do |day, supplies|
      if day == :fourth_of_july
        holiday_supplies = supplies[1]
      end
    end
  end 
  holiday_supplies
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
holiday_hash.each do |season, holiday|
  if season == :winter 
      holiday.each do |day, supplies|
        supplies << supply 
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holiday|
    if season == :spring
      holiday.each do |day, supplies|
        if day == :memorial_day
          supplies << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |season_key, holidays_value|
    if season == season_key
      holiday_hash[season][holiday_name] = supply_array
    end
  end

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |day, supplies|
        winter_supplies = winter_supplies + supplies
      end
    end
  end

  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday| 
    puts(season.to_s.capitalize+":")
    holiday.each do |day, supplies|
      supplies_str = ""
      supplies.each do |supply|
        supplies_str = supplies_str + "#{supply}" ", "
      end
      puts("  "+day.to_s.split("_").map{|el|el.capitalize}.join(" ")+":"+ ' ' + supplies_str[0, supplies_str.length-2])
    end 
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_days = []
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      if supplies.include?("BBQ")
        bbq_days << day
      end
    end
  end

  bbq_days
end







