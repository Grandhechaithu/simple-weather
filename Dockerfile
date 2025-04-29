# Use a lightweight nginx image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx files
RUN rm -rf ./*

# Copy your static files from the public folder into the nginx html directory
COPY project-root/ .


# Expose port 80
EXPOSE 80