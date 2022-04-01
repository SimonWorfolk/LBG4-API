# Install Node to run the application
FROM node:14
# Copy Package.json file into the container
COPY package.json .
# Install the dependancies for the application
RUN npm install 
# Set the Environment Variable for the PORT
ENV PORT=5000
#Copy the remaining files into the container
COPY . .
# Start the application
ENTRYPOINT npm start
