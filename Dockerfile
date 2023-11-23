FROM alpine@sha256:664888ac9cfd28068e062c991ebcff4b4c7307dc8dd4df9e728bedde5c449d91

ARG TIME_STAMP=unknown

# Create a unique file with the build argument value
RUN echo "$TIME_STAMP" > /unique_file_$BUILD_ARG.txt