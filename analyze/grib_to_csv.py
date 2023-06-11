import xarray as xr
import numpy as np
import pandas as pd
#import cfgrib
#import eccodes

d = xr.open_dataset('cloudcoverERA5.grib', engine='cfgrib')
out = {'tcc': np.array(d['tcc'].sel(latitude=49, longitude=13.5)), 'time': np.array(d['time'])}
df = pd.DataFrame(data=out)
df.to_csv('out/era5_total_cloud_cover.csv', sep='\t', encoding='utf-8')