# specificy node version, if not specified, will default to version
FROM node:15
WORKDIR /docker-tutorial
COPY package.json . 

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \ 
        then npm install; \
        else npm install --only=production; \
        fi
# if package.json does not change, skip to step 3 and 4
COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["node", "index.js", "dev"]