# Purpose to provide a in_batches interface around each
module Batching
  # Purpose adds start_index to Array
  class Batch < Array
    attr_accessor :start_index

    def end_index
      return nil if size.zero?

      start_index + size - 1
    end
  end

  def in_batches(batch_size: 1_000)
    return to_enum(:in_batches, batch_size: batch_size) unless block_given?

    batch = Batch.new

    process_batch_proc = proc do
      yield batch

      batch = Batch.new
    end

    each_with_index do |item, index|
      batch.start_index ||= index
      batch << item

      process_batch_proc.call if batch.size >= batch_size
    end

    process_batch_proc.call unless batch.empty?
  end
end
