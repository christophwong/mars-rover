require 'spec_helper'

describe Rover do
  let(:rover) { Rover.new({ x: 1, y: 2, direction: "N", moves:"LMLMLMLMM" }) }

  context 'when facing N' do
    it '#turn_left' do
      expect {rover.turn_left}.to change{ rover.direction }
      .from('N')
      .to('W')
    end

    it '#turn_right' do
      expect {rover.turn_right}.to change{ rover.direction }
      .from('N')
      .to('E')
    end

    it '#moves_forward' do
      expect { rover.moves_forward }.to change{ rover.y }.from(2).to(3)
    end
  end

  context 'when facing W' do
    before { rover.direction = 'W' }
    it '#turn_left' do
      expect {rover.turn_left}.to change{ rover.direction }
      .from('W')
      .to('S')
    end

    it '#turn_right' do
      expect {rover.turn_right}.to change{ rover.direction }
      .from('W')
      .to('N')
    end

    it '#moves_forward' do
      expect { rover.moves_forward }.to change{ rover.x }.from(1).to(0)
    end
  end

  context 'when facing S' do
    before { rover.direction = 'S' }
    it '#turn_left' do
      expect {rover.turn_left}.to change{ rover.direction }
      .from('S')
      .to('E')
    end

    it '#turn_right' do
      expect {rover.turn_right}.to change{ rover.direction }
      .from('S')
      .to('W')
    end

    it '#moves_forward' do
      expect { rover.moves_forward }.to change{ rover.y }.from(2).to(1)
    end
  end

  context 'when facing E' do
    before { rover.direction = 'E' }
    it '#turn_left' do
      expect {rover.turn_left}.to change{ rover.direction }
      .from('E')
      .to('N')
    end

    it '#turn_right' do
      expect {rover.turn_right}.to change{ rover.direction }
      .from('E')
      .to('S')
    end

    it '#moves_forward' do
      expect { rover.moves_forward }.to change{ rover.x }.from(1).to(2)
    end
  end

  it 'should run according to input moves' do
    expect(rover).to receive(:turn_left).exactly(4).times
    expect(rover).to receive(:moves_forward).exactly(5).times
    rover.run
  end

  it 'should report correct location' do
    expect(rover.report_location).to eq("1 2 N")
  end

  it 'should report new location after full run' do
    rover.run
    expect(rover.report_location).to eq("1 3 N")
  end

end
