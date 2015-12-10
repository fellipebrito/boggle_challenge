require "#{File.expand_path(File.dirname(__FILE__))}/../solution.rb"

RSpec.describe Solution, '#hello_world' do
  let(:rows) { %w(CSXY BALL HLSZ ATOE) }

  it 'generate one square grid of letters' do
    solution = Solution.new 6
    expect(solution.rows.count).to eq 6
  end

  it 'generate one random string of X chars' do
    solution = Solution.new
    expect(solution.generate_string(4).length).to eql 4
  end

  it 'return every world in a given grid' do
    solution = Solution.new
    solution.rows = rows
    expect(solution.words_found).to contain_exactly(*%w(CASE SALT BALL YLLA))
  end

  it 'return true if it is an word' do
    solution = Solution.new
    expect(solution.word?('BALL')).to be_truthy
  end

  it 'return all the rows found in the grid' do
    solution = Solution.new
    solution.rows = rows
    expect(solution.rows).to include(*%w(CSXY BALL HLSZ ATOE))
  end

  it 'return all the columns found in the grid' do
    solution = Solution.new
    solution.rows = rows
    expect(solution.columns).to include(*%w(CBHA SALT XLSO YLZE))
  end

  it 'return all the diagonals found in the grid' do
    solution = Solution.new
    solution.rows = rows
    expect(solution.diagonals).to include(*%w(HT BLO CASE SLZ XL
                                              ZO LST YLLA XAH SB))
  end

  xit 'handle words that occur within other words? i.e. catcher
        -> [cat, catch, her]' do
  end
end
