FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache ffmpeg nginx nginx-mod-rtmp

# Create folders
RUN mkdir -p /tmp/hls && mkdir -p /run/nginx

# Copy config
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose RTMP and HTTP ports
EXPOSE 1935 80

# Run nginx
CMD ["nginx", "-g", "daemon off;"]