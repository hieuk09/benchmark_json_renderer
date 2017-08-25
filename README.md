# bench_mark_json_renderer
A benchmark for some popular json renderers:

- [ActiveSupport::JSON](http://api.rubyonrails.org/classes/ActiveSupport/JSON.html)
- [jbuilder](https://github.com/rails/jbuilder)
- [RABL](https://github.com/nesquena/rabl)
- [ROAR](https://github.com/trailblazer/roar)
- [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers)
- [acts_as_api](https://github.com/fabrik42/acts_as_api)

## How to run

Run following command to setup data

```shell
rake db:create
rake db:schema:load
rake db:seed
```

Now, you can start benchmarking using `runner.sh` with:

```shell
chmod +x runner.sh
./runner.sh
```

[Result (in Vietnamese)](http://kipalog.com/posts/So-sanh-toc-do-cac-thu-vien-render-JSON)
