require 'rails_helper'
require 'benchmark'

describe 'books api' do
  describe '/books' do
    it 'benchmark' do
      Benchmark.bm do |x|
        x.report { get '/books' }
      end
    end
  end
end
