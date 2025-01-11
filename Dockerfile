# Use docker image ruby33 to build the image

FROM ruby:3.3.6-alpine

WORKDIR /tdd-kata/main

COPY ./ ./

# main.rb is a never ending process.
CMD ["ruby", "main.rb"]
