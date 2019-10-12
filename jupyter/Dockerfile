FROM continuumio/miniconda3:latest

LABEL Author=cccuroky@gmail.com

RUN apt-get update && \
    apt-get install -y curl gettext git && \
    apt-get autoremove -y && apt-get clean

# Install nodejs https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs && \
    apt-get autoremove -y && apt-get clean
# RUN npm config set registry https://registry.npm.taobao.org

# Install jupyterlab
RUN conda install jupyterlab && \
    conda clean -a

# Install bash kernel https://github.com/takluyver/bash_kernel
RUN python3 -m pip install --no-cache-dir bash_kernel
RUN python3 -m bash_kernel.install

# Install zsh kernel
# FIXME: Failure to install zsh_jupyter_kernel
# RUN python3 -m pip install zsh-jupyter-kernel
# RUN python3 -m zsh_jupyter_kernel.install

# Install python2 kernel, Good, but not used
# RUN apt install -y python2.7 python-pip
# RUN python2 -m pip install ipython==5.8 tornado==5.1.1 ipykernel==4.10.1
# RUN python2 -m ipykernel install

# Install c++ kernel https://github.com/QuantStack/xeus-cling
# -c conda-forge
# RUN conda install xeus-cling

# Install python package
RUN python3 -m pip install --no-cache-dir  requests lxml

# Install plugin and themes
RUN npm install -g @jupyterlab/application && \
    jupyter labextension install @jupyterlab/toc jupyterlab-drawio @jupyterlab/github && \
    npm cache clean --force && \
    rm -rf /opt/conda/share/jupyter/lab/staging

# RUN jupyter labextension install @oriolmirosa/jupyterlab_materialdarker

# Install only for jupyter, not work in jupyterlab
# RUN python -m pip install jupyterthemes jupyter_contrib_nbextensions

# For user
ARG PNAME=jupyter
ARG PUID=1000
ARG PGID=1000

RUN groupadd -g $PGID -o $PNAME
RUN useradd -m -s /bin/bash -u $PUID -g $PGID -o $PNAME
USER $PNAME
WORKDIR /home/$PNAME/

# Start
CMD jupyter lab --notebook-dir=/data/ --config=/config/jupyter_config.py
