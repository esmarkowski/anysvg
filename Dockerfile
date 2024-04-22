# Use an official Ruby runtime as a parent image
FROM ruby:3.3.0

# Set the working directory in the container to /app
WORKDIR /app

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install any needed packages specified in Gemfile
RUN bundle install

# Copy the rest of your application's code into the container
COPY . ./

# Run rackup when the container launches
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]