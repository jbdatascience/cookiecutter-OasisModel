__all__ = []    # list to store names of public methods and attributes in this module
                # that are automatically imported by using `import *`

# Python 2 standard library imports
import csv
import io
import logging
import os

# Python 2 non-standard library imports

# Oasis utils and other Oasis imports
from oasis_utils import (
    oasis_utils,
    oasis_log_utils,
)

from oasis_keys_server import BaseKeysLookup

class ModelNameKeysLookup(BaseKeysLookup):
    """
    Model-specific keys lookup logic for the model with shortname 'ModelName'. Multiple models
    each get their own keys lookup class, ModelNameKeysLookup, with a unique model name prefix.
    """

    @oasis_log_utils.oasis_log()
    def __init__(
        self,
        keys_data_directory=os.path.join(os.sep, 'var', 'oasis', 'keys_data'),
        supplier=None,
        model_name=None,
        model_version='0.0.0.1',
        areas=None,
        vulnerabilities=None,
        location_map=None,
        vulnerability_map=None,
        construction_class=None
    ):
        """
        Initialise the static data required for the lookup.
        """
        super(self.__class__, self).__init__(
            keys_data_directory,
            supplier,
            model_name,
            model_version,
            areas,
            vulnerabilities,
            location_map,
            vulnerability_map,
            construction_class
        )
        pass
    
    
    @oasis_log_utils.oasis_log()
    def process_locations(self, loc_data):
        """
        Read in raw location rows from request CSV data and generate
        exposure records. This is the main method to override in each model
        keys lookup class. Other methods inherited from the superclass
        BaseKeysLookup can also be used, please refer to the source:
        
        https://github.com/OasisLMF/oasis_keys_server/blob/master/BaseKeysLookup.py
        """
        pass
