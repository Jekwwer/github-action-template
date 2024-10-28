# .github/actions/greeting-docker/Dockerfile:
# Sets up the Docker container for the action.

FROM ubuntu:20.04

# Install dependencies and clean up
RUN apt-get update && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script into the container and make it executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
