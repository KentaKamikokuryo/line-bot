FROM python:3.7-alpine

# codeというディレクトリを作成し、そこを作業フォルダとする
WORKDIR /code

#デバッグモードON
ENV FLASK_ENV: 'development'   

# alpineのおまじない
RUN apk add --no-cache gcc musl-dev linux-headers

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
# requirements.txtをcode内に移動
COPY requirements.txt requirements.txt
# requirements.txtの中のライブラリをinstallする
RUN pip3 install -r requirements.txt

# すべてのファイルをcode内にマウントする。
COPY . .
CMD ["flask", "run"]

