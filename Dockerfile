FROM node:24-alpine AS builder

WORKDIR /app

COPY app/package*.json ./

RUN npm ci --omit=dev

COPY app/ ./

FROM node:24-alpine AS runtime

WORKDIR /app

COPY --from=builder /app ./

RUN rm -rf /usr/local/lib/node_modules/npm \
    && rm -f /usr/local/bin/npm \
    && rm -f /usr/local/bin/npx

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

USER node

CMD ["node", "index.js"]