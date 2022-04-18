FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz && tar -xvf v1.2.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo 'dudu' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /noVNC-1.3.0/vnc.html /noVNC-1.3.0/index.html
RUN echo 'cd /root' >>/luo.sh
RUN echo "su root -l -c 'vncserver :2000 ' "  >>/luo.sh
RUN echo 'cd /noVNC-1.3.0' >>/luo.sh
RUN echo './utils/novnc_proxy  --vnc localhost:7900 --listen 80 ' >>/luo.sh
RUN echo root:dudu|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
