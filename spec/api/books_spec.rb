require 'rails_helper'
require 'benchmark/ips'

describe 'books api' do
  let(:ultra_simple_params) { { type: 'ultra simple' } }
  let(:simple_params) { { type: 'simple' } }
  let(:complex_params) { { type: 'complex' } }

  describe '/books' do
    let!(:path) { "/books.json" }

    it 'benchmark' do
      Benchmark.ips do |x|
        x.config(time: 10, warmup: 2)
        x.report('collection ultra simple') { get(path, params: ultra_simple_params) }
        x.report('collection simple') { get path, params: simple_params }
        x.report('collection complex') { get path, params: complex_params }
      end
    end
  end

  describe '/book/:id' do
    let(:book) { Book.last }
    let!(:path) { "/books/#{book.id}.json" }

    it 'benchmarks' do
      Benchmark.ips do |x|
        x.config(time: 10, warmup: 2)
        x.report('ultra simple') { get(path, params: ultra_simple_params) }
        x.report('simple') { get path, params: simple_params }
        x.report('complex') { get path, params: complex_params }
      end
    end
  end
end
