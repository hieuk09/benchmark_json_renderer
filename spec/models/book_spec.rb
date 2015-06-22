require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Rabl::Renderer.json(book, 'books/ultra_simple', view_path: 'app/views') }
          x.report('simple') { Rabl::Renderer.json(book, 'books/simple', view_path: 'app/views') }
          x.report('complex') { Rabl::Renderer.json(book, 'books/complex', view_path: 'app/views') }
        end
      end
    end

    context 'collection' do
      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { Rabl::Renderer.json(books, 'books/ultra_simple_collection', view_path: 'app/views') }
          x.report('collection simple') { Rabl::Renderer.json(books, 'books/simple_collection', view_path: 'app/views') }
          x.report('collection complex') { Rabl::Renderer.json(books, 'books/complex_collection', view_path: 'app/views') }
        end
      end
    end
  end
end
