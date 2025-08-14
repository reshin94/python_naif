FROM registry.access.redhat.com/ubi9/python-312

USER 0

RUN yum update -y && \
    yum install -y \
    java-11-openjdk-devel \
    krb5-workstation && \
    yum clean all

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"

COPY requirements.txt .

# Install required Python packages
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

CMD ["python"]