# Build stage
FROM rust:bookworm AS builder

WORKDIR /dist
COPY . .
RUN dx build --release
