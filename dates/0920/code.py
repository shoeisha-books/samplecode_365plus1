Google Colabolatoryでシークレットモードを利用してAPIキーを登録する。

from google.colab import userdata
import os

os.environ["OPENAI_API_KEY"] = userdata.get('OPENAI_API_KEY')