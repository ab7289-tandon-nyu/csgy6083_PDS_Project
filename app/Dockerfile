FROM python:3.9.6-slim
WORKDIR /app
COPY requirements.txt /app/
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /app/
# EXPOSE 5000
EXPOSE $PORT
CMD flask run --host=0.0.0.0 --port=$PORT
