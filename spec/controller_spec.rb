require 'spec_helper'

describe Controller do
  let (:controller) { Controller.new("5 6\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM") }

  it 'should create Plateau with first line of input' do
    expect(Plateau).to receive(:new).with({x: 5, y: 6})
    controller
  end

  it 'should create Rovers with the rest of input' do
    expect(Rover).to receive(:new).with( {x: 1, y: 2, direction: "N", moves:"LMLMLMLMM"} )
    expect(Rover).to receive(:new).with( {x: 3, y: 3, direction: "E", moves:"MMRMMRMRRM"} )
    controller
  end
end
