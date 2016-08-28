FROM ruby:2.3
MAINTAINER thangtd90@gmail.com

COPY entrypoint.rb /scripts/entrypoint.rb

ENTRYPOINT ["ruby", "/scripts/entrypoint.rb"]
