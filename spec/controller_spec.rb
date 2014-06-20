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

  it 'should run all Rovers' do
    expect(controller.rovers[0]).to receive(:run)
    expect(controller.rovers[1]).to receive(:run)
    controller.run_all_rovers
  end

  it 'should run all rovers and return final location in string form' do
    expect(controller.mission_report).to eq("1 3 N\n5 1 E")
  end
end
