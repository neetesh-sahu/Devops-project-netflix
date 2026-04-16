FROM node:18

WORKDIR /app

# 🔥 direct sab copy karo (node_modules included)
COPY . .

EXPOSE 3000

CMD ["node", "app.js"]
