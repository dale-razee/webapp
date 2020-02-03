#Build an intermediate image
FROM node:alpine as buildImg

RUN apk update

RUN mkdir -p /usr/src/
ENV PATH="$PATH:/usr/src/"

WORKDIR /usr/src/
COPY package.json /usr/src/
COPY package-lock.json /usr/src/

RUN npm install --production --loglevel=warn
COPY . /usr/src/

# Build the production image
FROM node:alpine

RUN mkdir -p /usr/src/
ENV PATH="$PATH:/usr/src/"
WORKDIR /usr/src/
COPY --from=buildImg /usr/src /usr/src

EXPOSE 3000
CMD ["npm", "start"]
