# build_step
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn 
COPY . .
RUN yarn build

# app/build -> all stuff we care about

# run_step
FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html


