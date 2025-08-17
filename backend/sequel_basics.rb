# sequel_basics.rb
require 'sequel'
require 'json'

# Connect to the same DB you already use
DB = Sequel.sqlite('qa_tests.db')

# Reference the dataset (table)
results = DB[:test_results]

# --- 1. Insert sample data ---
puts "Inserting sample data..."
results.insert(test_name: "Login Test", status: "passed")
results.insert(test_name: "Signup Test", status: "failed")
results.insert(test_name: "Checkout Test", status: "passed")
results.insert(test_name: "Profile Test", status: "skipped")

# --- 2. Fetch all rows ---
puts "\nAll results:"
puts results.all.to_json

# --- 3. Filtering (WHERE) ---
puts "\nOnly passed tests:"
puts results.where(status: "passed").all.to_json

# --- 4. Ordering ---
puts "\nOrdered by test_name:"
puts results.order(:test_name).all.to_json

# --- 5. Pagination ---
puts "\nFirst 2 tests (limit/offset):"
puts results.limit(2, 0).all.to_json  # limit 2 starting from offset 0
puts "\nNext 2 tests:"
puts results.limit(2, 2).all.to_json

# --- 6. Transactions ---
puts "\nTransaction demo (rollback on error):"
begin
  DB.transaction do
    results.insert(test_name: "Temp Test", status: "pending")
    raise "Something went wrong!"  # force rollback
  end
rescue
  puts "Transaction rolled back!"
end

puts "\nFinal results (after rollback):"
puts results.all.to_json
