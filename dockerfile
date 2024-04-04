FROM python:3.10.12
WORKDIR /
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Args for build step
ARG AIRTABLE=api_key
ARG GOOGLE_CLOUD=api_key
ARG OPENAI=api_key

# ENV Variables
ENV AIRTABLE_API_KEY=$AIRTABLE
ENV GOOGLE_CLOUD_API_KEY=$GOOGLE_CLOUD
ENV OPENAI_API_KEY=$OPENAI

# Port Service
EXPOSE 5000

#Command to run the service inside the container
CMD ["gunicorn", "-b", "0.0.0.0:5000", "main:app"]
