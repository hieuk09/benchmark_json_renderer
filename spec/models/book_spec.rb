require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Books::UltraSimple.prepare(book).to_json }
          x.report('simple') { Books::Simple.prepare(book).to_json }
          x.report('complex') { Books::Complex.prepare(book).to_json }
        end
      end
    end

    context 'collection' do
      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }
      let(:ultra_simple_books) { Books::UltraSimple.for_collection.prepare(books) }
      let(:simple_books) { Books::Simple.for_collection.prepare(books) }
      let(:complex_books) { Books::Complex.for_collection.prepare(books) }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { ultra_simple_books.to_json }
          x.report('collection simple') { ultra_simple_books.to_json }
          x.report('collection complex') { ultra_simple_books.to_json }
        end
      end
    end
  end
end
