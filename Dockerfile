# Base image with Fontconfig support
FROM alpine:latest

LABEL maintainer="Mohammad Golamrabbii <https://linktr.ee/golamrabbii>"
LABEL description="World's Largest English & Western Open Typography Archive (50,000+ Fonts)"

# Install font tools and git
RUN apk add --no-cache git fontconfig curl ca-certificates

# Create font directory
WORKDIR /usr/share/fonts/truetype/english-mega-archive

# Clone English Fonts Mega Archive
RUN git clone --depth 1 https://github.com/mohammadgolamrabbii/English-Fonts-Mega-Archive.git . \
    && fc-cache -fv /usr/share/fonts/truetype/english-mega-archive

# Verification test on build
RUN fc-list :lang=en | head -n 20

CMD ["fc-list", ":lang=en"]
