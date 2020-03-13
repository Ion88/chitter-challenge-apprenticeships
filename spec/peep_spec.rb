require 'peep'

 describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    #Add test data
    connection.exec("INSERT INTO peeps (message) VALUES ('Hey, how this website works?');")
    connection.exec("INSERT INTO peeps (message) VALUES ('I am new here');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Hello there');")

    peeps = Peep.all

    expect(peeps).to include 'Hey, how this website works?'
    expect(peeps).to include 'I am new here'
    expect(peeps).to include 'Hello there'
  end
 end
