# Sử dụng bản Python 3.11 slim (phiên bản ổn định, tương thích hoàn toàn với Railway)
FROM python:3.11-slim

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Cài đặt bash và công cụ dos2unix (để tự động diệt lỗi CRLF của Windows)
RUN apt-get update && apt-get install -y bash dos2unix && rm -rf /var/lib/apt/lists/*

# Copy requirements và cài đặt thư viện Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ source code vào container
COPY . .

# Lệnh cuối cùng: Khởi chạy dự án bằng python trực tiếp
ENTRYPOINT python start_all.py
