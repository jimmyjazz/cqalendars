DB.create_table :appointments do
  primary_key :id
  DateTime :start_time
  DateTime :end_time
  String :description
  index :start_time
  index :end_time 
end

appointments = DB[:appointments]

appointments.insert(start_time: "2015-02-05 09:50:00", end_time: "2015-02-05 10:20:00", description: "Collis' RubyConf Keynote")
appointments.insert(start_time: "2015-02-04 19:00:00", end_time: "2015-02-04 23:00:00", description: "RubyConf Opening Partay!")
appointments.insert(start_time: "2015-02-07 16:30:00", end_time: "2015-02-07 20:45:00", description: "RubyConf Picnic")
