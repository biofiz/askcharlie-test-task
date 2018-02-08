require './robot'

RSpec.describe Robot do
  subject { Robot.new }

  context 'when robot is placed' do
    before do
      subject.place(2,2,'SOUTH')
    end

    it 'turns left' do
      subject.left
      expect(subject.instance_variable_get(:@position)).to eq 'EAST'
    end

    it 'turns right' do
      subject.right
      expect(subject.instance_variable_get(:@position)).to eq 'WEST'
    end

    it 'moves' do
      subject.move
      expect(subject.instance_variable_get(:@x_coordinate)).to eq 2
      expect(subject.instance_variable_get(:@y_coordinate)).to eq 1
    end

    it 'reports' do
      expect { subject.report }.to output("# Output: 2,2,SOUTH\n").to_stdout
    end
  end

  context 'when robot is not placed' do
    it 'raises an error' do
      expect { subject.move }.to raise_error('Please place the robot first')
    end
  end

  describe 'validations' do
    context 'when placing outside of the table' do
      it 'raises an error' do
        expect { subject.place(7,0,'NORTH') }.to raise_error('X coordinate should be in range 0..4')
      end
    end
  end
end
