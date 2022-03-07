FROM ruby:2.7.2

# RUN useradd -u 1000 local
# ENV http_proxy http://proxy.hcm.fpt.vn:80
# ENV https_proxy http://proxy.hcm.fpt.vn:80

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev
RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler -v 2.2.11

RUN bundle install -j4
COPY . /myapp

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh

# ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
