# Build stage
FROM rust:bookworm AS builder

WORKDIR /app
COPY . .
RUN cargo install dioxus-cli
RUN dx build --release


# Final run stage
FROM debian:bookworm-slim AS runner
COPY --from=builder /app/dist
CMD ["/app/example-rust"]
