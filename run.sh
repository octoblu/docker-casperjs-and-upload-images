#!/bin/bash

run(){
  local cmd="$@"
  casperjs $cmd # intentionally not quoted
}

upload_image_to_slack(){
  local filename="$1"
  local filepath="$2"

  chmod +x ./upload-image-to-slack
  ./upload-image-to-slack --filename "$filename" < $filepath
}

upload_images_to_slack(){
  if [ ! -d "images" ]; then
    return
  fi
  if [ -z "$(ls "images")" ]; then
    return
  fi

  chmod -R 777 images
  for filename in $(ls images); do
    upload_image_to_slack "$filename" "images/${filename}"
  done
}

main(){
  local cmd="$@"

  run "$cmd"
  echo "done, gonna upload the remains"
  upload_images_to_slack
}

main $@
