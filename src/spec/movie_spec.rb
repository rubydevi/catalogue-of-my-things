require_relative '../classes/movie'
require 'date'
require 'rspec'

describe Movie do
  before :each do
    @movie = Movie.new(true, 'The Movie', Date.new(2022 - 0o1 - 0o7))
  end

  it 'is an instance of Movie' do
    expect(@movie).to be_an_instance_of(Movie)
  end

  it 'has an id number' do
    expect(@movie.id).to be_an(Integer)
  end

  it 'has a silent attribute of type boolean' do
    expect(@movie.silent).to be(true).or be(false)
  end

  it 'has an archived attribute of type boolean' do
    expect(@movie.archived).to be(true).or be(false)
  end

  it 'can add a publish_date' do
    @movie.publish_date = Date.today
    expect(@movie.publish_date).to eq(Date.today)
  end

  it 'can be silent' do
    @movie.silent = true
    expect(@movie.silent).to be(true)
  end

  it 'can be archived' do
    @movie.archived = true
    expect(@movie.archived).to be(true)
  end

  it 'return true when parents method and silent are true' do
    expect(@movie.can_be_archived?).to be(true)
  end
end
