# rosindustrial/noether:kinetic
FROM rosindustrial/core:kinetic
LABEL maintainer "Austin.Deric@SwRI.org"

COPY setup_script.bash /
RUN bash -c "chmod +x /setup_script.bash && /setup_script.bash"
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
