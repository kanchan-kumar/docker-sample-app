FROM node:alpine as builder
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build - all the build files

FROM nginx
# Only for cloud AWS, GCP
#EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
