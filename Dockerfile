# Build stage
FROM rust:bookworm AS builder

WORKDIR /app
COPY . .
RUN rustup target add wasm32-unknown-unknown
RUN cargo install dioxus-cli
RUN dx build --features web --platform fullstack --release --verbose


# Final run stage
FROM rust:bookworm AS runner
COPY . .
RUN rustup target add wasm32-unknown-unknown
RUN cargo install dioxus-cli
CMD dx serve --platform fullstack --verbose
