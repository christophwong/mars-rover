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
  end

  xit 'should report location' do
    expect(rover.report_location).to eq("1 2 N")
  end
end
