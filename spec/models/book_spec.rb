require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Oj.dump(Books::UltraSimple.new(book).as_json) }
          x.report('simple') { Oj.dump(Books::Simple.new(book).as_json) }
          x.report('complex') { Oj.dump(Books::Complex.new(book).as_json) }
        end
      end
    end

    context 'collection' do
      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }
      let(:ultra_simple_books) { books.map { |book| Books::UltraSimple.new(book) } }
      let(:simple_books) { books.map { |book| Books::Simple.new(book) } }
      let(:complex_books) { books.map { |book| Books::Complex.new(book) } }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { Oj.dump(ultra_simple_books.as_json) }
          x.report('collection simple') { Oj.dump(simple_books.as_json) }
          x.report('collection complex') { Oj.dump(complex_books.as_json) }
        end
      end
    end
  end
end
