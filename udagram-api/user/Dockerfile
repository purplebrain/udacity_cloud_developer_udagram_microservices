# Use NodeJS base image
#FROM node:13
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
#COPY udagram-api/user/package*.json ./
COPY package*.json ./

# Copy all other files
#COPY udagram-api/user/ ./
COPY . ./

# Install dependencies
RUN npm install --build-from-source .

# Copy app source
#COPY udagram-api/ .

# Bind the port that the image will run on
EXPOSE 8082

# Define the Docker image's behavior at runtime
CMD ["npm", "run", "dev", "--external"]
#ENTRYPOINT ["/bin/bash", "./run.sh"]
