require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Books::UltraSimple.new(book).serialized_json }
          x.report('simple') { Books::Simple.new(book).serialized_json }
          x.report('complex') { Books::Complex.new(book).serialized_json }
        end
      end
    end

    context 'collection' do
      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }
      let(:ultra_simple_books) { Books::UltraSimple.new(books) }
      let(:simple_books) { Books::Simple.new(books) }
      let(:complex_books) { Books::Complex.new(books) }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { ultra_simple_books.serialized_json }
          x.report('collection simple') { simple_books.serialized_json }
          x.report('collection complex') { complex_books.serialized_json }
        end
      end
    end
  end
end
