require_relative '../classes/source'

describe Source do
  before :each do
    @source = Source.new('From a friend')
  end

  it 'is an instance of Source' do
    expect(@source).to be_an_instance_of(Source)
  end

  it 'has an id number' do
    expect(@source.id).to be_an(Integer)
  end

  it 'has a name of type string' do
    expect(@source.name).to be_a(String)
  end

  it 'has a name' do
    @source.name = 'From a friend'
    expect(@source.name).to eq('From a friend')
  end

  it 'has an empty items array initially' do
    expect(@source.items).to be_empty
  end

  it 'can add an item' do
    item = double('item')
    expect(item).to receive(:source=).with(@source)
    @source.add_item(item)
    expect(@source.items).to include(item)
  end

  it 'correctly converts to a hash' do
    expect(@source.to_hash).to eq({ id: @source.id, name: 'From a friend' })
  end

  it 'has an items of type array' do
    expect(@source.items).to be_a(Array)
  end
end
