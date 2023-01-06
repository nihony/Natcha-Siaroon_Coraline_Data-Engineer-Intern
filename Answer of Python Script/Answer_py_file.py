from bs4 import BeautifulSoup
import requests
import pandas as pd
import json
from pandas import json_normalize

api_1 = 'https://randomuser.me/api'
res_1 = requests.get(api_1)
data_1 = res_1.json()

list_1 = []
api_1 = 'https://randomuser.me/api'
for i in range(20):
  res_1 = requests.get(api_1)
  data_1 = res_1.json()
  json_norm_1 = json_normalize(data_1['results'])
  list_1 += [data_1]

df = pd.json_normalize(list_1, record_path =['results'])
df = df[['name.first', 'name.last', 'gender']]
df = df.rename(columns={'name.first': 'first_name', 'name.last': 'last_name', 'gender': 'gender(actual)'})

list_fname = []
for i in range(len(df)):
  list_fname += [df.iloc[i, 0]]

list_2 = []
api_2 = 'https://api.genderize.io/?'
for fname in list_fname:
  add_fname = api_2 + 'name=' + fname
  res_2 = requests.get(add_fname)
  data_2 = res_2.json()
  list_2 += [data_2]

df_2 = pd.json_normalize(list_2)
df_2 = df_2[['gender', 'probability']]
df_2 = df_2.rename(columns={'gender': 'gender(predict)'})

df_3 = pd.concat([df, df_2], axis=1)
df_3['same_gender'] = 1
for i in range(len(df_3)):
  if df_3.iloc[i, 2] == df_3.iloc[i, 3]:
    df_3.iloc[i, 5] = 'true'
  else:
    df_3.iloc[i, 5] = 'false'
print(df_3)