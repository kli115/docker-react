FROM node:alpine AS builder
WORKDIR '/app'
COPY package*.json ./
COPY ./ ./
RUN npm install && npm run build
# CMD ["npm" "run" "build"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
