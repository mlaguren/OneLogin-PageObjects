def update_name_in_csv
  file = CSV.read("dupe.csv")
  hyphen=Faker::Name.last_name
  maiden=file[1][1]
  new_last=maiden+hyphen
  file[1].insert(1, new_last)
  file[1].delete_at(2)
  CSV.open("newdupe.csv", "wb") do |csv|
    csv << file[0]
    csv << file[1]
  end
  $csvFile="newdupe.csv"
end
