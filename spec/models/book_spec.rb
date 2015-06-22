require 'rails_helper'

describe Book do
  describe 'render json' do
    context 'single' do
      let!(:book) { Book.last }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('ultra simple') { Oj.dump(book.as_api_response(:ultra_simple)) }
          x.report('simple') { Oj.dump(book.as_api_response(:simple)) }
          x.report('complex') { Oj.dump(book.as_api_response(:complex)) }
        end
      end
    end

    context 'collection' do
      let!(:books) { Book.latest.includes(:author, { related_books: :author }) }

      it 'renders json' do
        Benchmark.ips do |x|
          x.config(time: 10, warmup: 2)
          x.report('collection ultra simple') { Oj.dump(books.as_api_response(:ultra_simple)) }
          x.report('collection simple') { Oj.dump(books.as_api_response(:simple)) }
          x.report('collection complex') { Oj.dump(books.as_api_response(:complex)) }
        end
      end
    end
  end
end
