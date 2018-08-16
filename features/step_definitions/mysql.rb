# change this as needed:
Before do
  @hostname = "127.0.0.1"	
  @username = 'x'
  @password = 'x'
end

def get_databases()
  @dbs = 0
  client = Mysql2::Client.new(
    host: @hostname,
    username: @username,
    password: @password,
    port: @port
  )
  results = client.query("SHOW DATABASES;")
  @dbs = results.size
  client.close
end

def get_tables_for_database(database)
  @tables = 0
  client = Mysql2::Client.new(
  	host: @hostname,
    username: @username,
    password: @password,
    port: @port,
    database: database 
  )
  results = client.query("SHOW TABLES;")
  @tables = results.size
  client.close
end

def get_all_items_for_table(database, table)
  @items = 0	
  client = Mysql2::Client.new(
    host: @hostname,
    username: @username,
    password: @password,
    port: @port,
    database: database 
  )
  query_string = "SELECT * FROM #{table};"
  results = client.query(query_string)
  @items = results.size
  client.close
end

def get_keyfile() 
  `vagrant ssh-config | grep IdentityFile | awk '{print $2}'`
end

# information from `vagrant ssh-config`
Given("I ssh to vagrantbox {string}") do |string| 
  hostname="127.0.0.1"
  key = get_keyfile.strip
  @gateway = Net::SSH::Gateway.new(hostname, "vagrant", {
    :auth_methods => [
        "publickey",
        "password"
    ],
    :port=>"2222",
    :keys => [ key ]
  })
  @port = @gateway.open(hostname, 3306, 3307)
end

When(/I have a MySQL server on (.+)$/) do |host|
  @host = host
end

Then(/it should have more than (\d+) databases$/) do |dbs|
  get_databases()
  expect(@dbs).to be > dbs.to_i
end

Then(/it should have more than (\d+) tables in database '(.+)'$/) do |tables, db|
  get_tables_for_database(db)
  expect(@tables).to be > tables.to_i
end

Then(/table '(.+)' in database '(.+)' should have at least (\d+) items$/) do |table, db, items|
  get_all_items_for_table(db, table)
  expect(@items).to be >= items.to_i
end

Then(/it should clean up/) do
  @gateway.shutdown!
end	