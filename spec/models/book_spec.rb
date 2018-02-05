require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      def render_json(template, item)
        builder = ApplicationController.new.view_context
        builder.instance_variable_set(:@book, item)
        builder.render(file: template)
      end

      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Oj.dump(render_json('/books/ultra_simple', book)) }
          x.report('simple') { Oj.dump(render_json('/books/simple', book)) }
          x.report('complex') { Oj.dump(render_json('/books/complex', book)) }
        end
      end
    end

    context 'collection' do
      def render_json(template, item)
        builder = ApplicationController.new.view_context
        builder.instance_variable_set(:@books, item)
        builder.render(file: template)
      end

      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { Oj.dump(render_json('books/ultra_simple_collection', books)) }
          x.report('collection simple') { Oj.dump(render_json('books/simple_collection', books)) }
          x.report('collection complex') { Oj.dump(render_json('books/complex_collection', books)) }
        end
      end
    end
  end
end
