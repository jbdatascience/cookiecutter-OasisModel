__all__ = [
  '{{cookiecutter.model_identifier.replace(' ', '').upper()}}KeysLookup'
]  # This should be a list of all public methods and attributes that can be imported from this
   # module elsewhere. This list should contain the class names of all the model-specific keys
   # keys lookup classes defined here.

# Python 2 standard library imports
import csv
import io
import logging
import os

# Python 2 non-standard library imports

# Oasis utils and other Oasis imports

from .OasisBaseKeysLookup import OasisBaseKeysLookup

from oasis_utils import (
    oasis_utils,
    oasis_log_utils,
)

# Model keys server imports
from .utils import *

class {{cookiecutter.model_identifier.replace(' ', '').upper()}}KeysLookup(OasisBaseKeysLookup):
    """
    Model-specific keys lookup logic.
    """

    @oasis_log_utils.oasis_log()
    def __init__(self, keys_data_directory, supplier, model_name, model_version):
        """
        Initialise the static data required for the lookup.
        """
        super(self.__class__, self).__init__(
            keys_data_directory,
            supplier,
            model_name,
            model_version
        )
        pass
    
    
    @oasis_log_utils.oasis_log()
    def process_locations(self, loc_data, mime_type=oasis_utils.MIME_TYPE_CSV):
        """
        Read in raw location rows from request CSV data and generate
        exposure records. This is the main method to override in each model
        keys lookup class. Other methods inherited from the superclass
        BaseKeysLookup can also be used, please refer to the source:
        
        https://github.com/OasisLMF/oasis_keys_lookup/blob/master/BaseKeysLookup.py
        """
        pass
