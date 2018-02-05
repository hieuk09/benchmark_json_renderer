 #!/bin/bash

 array=("master" "acts_as_api" "active_model_serializers" "grape_entity" "jbuilder" "jbuilder_with_partial" "rabl" "roar" "fast_jsonapi")
 for i in "${array[@]}"
 do
   env -i git checkout $i
   echo $i
   rspec
 done
