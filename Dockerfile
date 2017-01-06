FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y dovecot-imapd
ADD scripts /
RUN chmod a+x /setup_dovecot_mail_user.sh
RUN chmod a+x /start_container.sh
RUN /setup_dovecot_mail_user.sh automation 
RUN echo !include auth-passwdfile.conf.ext >> /etc/dovecot/conf.d/10-auth.conf
RUN echo disable_plaintext_auth = no >> /etc/dovecot/conf.d/10-auth.conf
RUN echo log_path = /var/log/dovecot.log >> /etc/dovecot/conf.d/10-logging.conf
RUN echo ssl = no >> /etc/dovecot/conf.d/10-ssl.conf
RUN echo auth    required        pam_unix.so  >> /etc/pam.d/dovecot
RUN echo account required        pam_unix.so  >> /etc/pam.d/dovecot
CMD /bin/bash /start_container.sh
EXPOSE 993 143
