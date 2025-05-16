# Stage 1: Build stage (optional for frameworks)
FROM nginx:alpine AS final

# Copy HTML to Nginx public folder
COPY index.html /usr/share/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
