

lsof -ti:8886 | xargs kill -9

ssh -N -f -L 8886:127.0.0.1:8887  solovyanov_m@ncs-design.mipt.ru -v -v

#ssh solovyanov_m@ncs-design.mipt.ru start-jupyter.sh