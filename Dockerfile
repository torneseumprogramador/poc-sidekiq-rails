# Use the official Ruby image as a parent image
FROM ruby:3.2.2

# Set the working directory in the container
WORKDIR /app

# Install system dependencies for Rails and PostgreSQL client
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN gem install bundler && bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose the port on which your Rails application will run (not necessary when using docker-compose)
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
