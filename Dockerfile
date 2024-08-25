# Build stage
FROM rust:bookworm AS builder

WORKDIR /dist
COPY . .
RUN cargo install dioxus-cli
RUN dx build --release
