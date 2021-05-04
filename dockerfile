FROM continuumio/miniconda3
WORKDIR /app

# Create the environment
ADD https://gitlab.com/geostack/library/-/wikis/uploads/c32d9c69086f9bd7d8605819ae97b7a4/environment.yml .
RUN conda env create -f environment.yml

# Use the environment at startup (https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754)
RUN echo "source activate geostack" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

# Make RUN commands use the new environment (https://pythonspeed.com/articles/activate-conda-dockerfile/#working)
SHELL ["conda", "run", "-n", "geostack", "/bin/bash", "-c"]

# Install geostack 
RUN conda config --add channels conda-forge 
RUN conda config --append channels geostack 
RUN conda install -c geostack geostack 
RUN python -c "import geostack"

#RUN python -c "import geostack"
#
# The code to run when the container is started
COPY run.py .
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "geostack", "python", "run.py"]