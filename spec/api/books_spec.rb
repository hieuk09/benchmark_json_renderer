require 'rails_helper'
require 'benchmark/ips'

describe 'books api' do
  describe '/books' do
    it 'benchmark' do
      Benchmark.ips do |x|
        x.config(:time => 10, :warmup => 2)
        x.report { get '/books.json' }
      end
    end
  end
end
