FROM swift:latest
WORKDIR /app
COPY script.swift .
RUN swiftc script.swift -o script && chmod +x script
CMD ["/app/script"]
