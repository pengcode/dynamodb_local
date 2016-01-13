FROM java:openjdk-6-jre

RUN curl -o dynamodb.tar.gz -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_2016-01-07_1.0.tar.gz && \
    mkdir -p /opt/dynamodb_local && \
    tar -zxf dynamodb.tar.gz --directory /opt/dynamodb_local && \
    rm -rf dynamodb.tar.gz

EXPOSE 8000
VOLUME /data

CMD ["java", "-Djava.library.path=/opt/dynamodb_local/DynamoDBLocal_lib", \
     "-jar", "/opt/dynamodb_local/DynamoDBLocal.jar", \
     "-dbPath", "/data", \
      "-sharedDb"]
