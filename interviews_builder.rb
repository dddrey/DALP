DateTime.new(2020, 12, 2, 10, 0, 0)
# ––––––––––––––
DateTime.new(2020, 12, 9, 20, 0, 0)

date_indexes = ['3/12/2020', '4/12/2020', '5/12/2020', '6/12/2020', '7/12/2020', '8/12/2020', '9/12/2020']
hour_indexes = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00']

# index is a DATE. 0 is 3/12/20, 9 is 9/12/20
tair_interviews = [
  [true, true, false, true, true, false, false, true, true, true, true],
  [true, true, false, true, true, false, false, true, true, true, true],
  [true, true, true, true, true, false, true, true, true, true, false],
  [false, false, true, true, true, false, true, true, true, true, true],
  [true, true, false, true, true, false, false, true, true, true, false],
  [true, true, false, true, true, false, false, true, true, true, false],
  [true, true, true, true, true, false, true, true, true, true, false],
]

tair_interviews.each_with_index do |date_arr, index|
  day, month, year = date_indexes[index].split('/')

  date_arr.each_with_index do |time_val, i|
    next unless time_val == true
    hour = hour_indexes[i].split(':')[0]

    Interview.create(
      datetime_stamp: DateTime.new(2020, 12, day.to_i, hour.to_i, 0, 0),
      date_string: date_indexes[index],
      time_string: hour_indexes[i],
      expert_id: 1
    )
  end
end



rami_interviews = [
  [true, true, false, false, false, false, false, true, true, true, true],
  [true, true, true, true, false, true, true, true, false, true, true],
  [true, true, true, false, true, true, true, true, false, true, true],
  [true, true, true, true, false, true, true, true, false, true, true],
  [true, true, true, false, true, true, true, true, false, true, true],
  [true, true, true, true, false, true, true, true, false, true, true],
  [true, true, false, false, false, false, false, true, true, true, true],
]

rami_interviews.each_with_index do |date_arr, index|
  day, month, year = date_indexes[index].split('/')

  date_arr.each_with_index do |time_val, i|
    next unless time_val == true
    hour = hour_indexes[i].split(':')[0]

    Interview.create(
      datetime_stamp: DateTime.new(2020, 12, day.to_i, hour.to_i, 0, 0),
      date_string: date_indexes[index],
      time_string: hour_indexes[i],
      expert_id: 2
    )
  end
end




wafaa_interviews = [
  [false, false, false, false, false, false, false, false, true, true, true],
  [false, false, false, false, false, false, false, false, true, true, true],
  [false, false, false, false, false, false, true, true, true, false, false],
  [false, false, false, false, false, false, true, true, true, false, false],
  [false, false, false, false, false, false, false, false, true, true, true],
  [false, false, false, false, false, false, false, false, true, true, true],
  [false, false, false, false, false, false, false, false, true, true, true],
]

wafaa_interviews.each_with_index do |date_arr, index|
  day, month, year = date_indexes[index].split('/')

  date_arr.each_with_index do |time_val, i|
    next unless time_val == true
    hour = hour_indexes[i].split(':')[0]

    Interview.create(
      datetime_stamp: DateTime.new(2020, 12, day.to_i, hour.to_i, 0, 0),
      date_string: date_indexes[index],
      time_string: hour_indexes[i],
      expert_id: 3
    )
  end
end
