#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
@author: Ming Zhao 
"""

# setup.py
from setuptools import setup, find_packages

REQUIRED_PACKAGES = [
                     'pyYaml>=3.12',
                     'keras>=2.0',
                     'matplotlib',
		             'h5py'
                     ]


setup(
    name='mnist_ae_trainer',
    version='0.1',
    install_requires=REQUIRED_PACKAGES,
    packages=find_packages(),
    include_package_data=True,
    description='Example trainer package for MNIST convolutional autoencoder',
    author='mingzhao@nyt',
    zip_safe=False
)
