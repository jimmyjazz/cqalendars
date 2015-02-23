DB.create_table :appointments do
  primary_key :id
  DateTime :start_time
  DateTime :end_time
  String :description
  index :start_time
  index :end_time 
end
