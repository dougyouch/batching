require 'spec_helper'

describe Batching do
  let(:list) do
    [
      8,
      1,
      19,
      30,
      14,
      10,
      1,
      2
    ]
  end

  let(:batching) do
    list.extend(Batching)
  end

  context '.in_batches' do
    it 'process list in batches' do
      results = []
      start_indexes = []
      end_indexes = []
      batching.in_batches(batch_size: 3) do |batch|
        results << batch.sum
        start_indexes << batch.start_index
        end_indexes << batch.end_index
      end

      expect(results).to eq([28, 54, 3])
      expect(start_indexes).to eq([0, 3, 6])
      expect(end_indexes).to eq([2, 5, 7])
    end

    describe 'to_enum' do
      it 'process the first batch only' do
        results = []
        start_indexes = []
        end_indexes = []
        batch = batching.in_batches(batch_size: 3).first
        results << batch.sum
        start_indexes << batch.start_index
        end_indexes << batch.end_index

        expect(results).to eq([28])
        expect(start_indexes).to eq([0])
        expect(end_indexes).to eq([2])
      end
    end
  end
end
