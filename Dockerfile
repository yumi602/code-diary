# ベースイメージ（Herokuと同じDebian系）
FROM ruby:3.3.7

# 環境変数
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/bundle \
    BUNDLE_WITHOUT=development:test

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Yarn / esbuild / tailwind も使えるようにする
RUN npm install -g yarn esbuild

# アプリケーションディレクトリ
WORKDIR /app

# Gemfile をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4

# ソースをコピー
COPY . .

# アセットプリコンパイル（本番では必須）
RUN bundle exec rake assets:precompile

# ポート指定
EXPOSE 8080

# 本番用サーバーを起動
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
