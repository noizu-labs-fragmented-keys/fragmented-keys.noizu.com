# Static landing site — hand-authored HTML/CSS served by nginx.
# Build context is the site root (index.html + static assets).
# Final stage MUST be named "production" — docker-build / GHA target it.
FROM nginx:alpine AS production
COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
