FROM alpine:3.13

ENV LANG C.UTF-8

RUN apk add --no-cache samba-common-tools samba-server \
    && mkdir -p /var/lib/samba \
    && touch \
        /etc/samba/lmhosts \
        /var/lib/samba/account_policy.tdb \
        /var/lib/samba/registry.tdb \
        /var/lib/samba/winbindd_idmap.tdb

COPY smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp

CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
