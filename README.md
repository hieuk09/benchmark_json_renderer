# bench_mark_json_renderer
A benchmark for several json renderers

## How to run

Run following command to setup data

```shell
rake db:create
rake db:schema:load
rake db:seed
```

Now, you can start benchmarking using [this
script](https://gist.github.com/hieuk09/fee5738786c7430d1da7).
Copy it into your project folder and you can run:

```shell
chmod +x runner.sh
./runner.sh
```
