FROM python:3.8.6
EXPOSE 8001

RUN mkdir /dotfiles
WORKDIR /dotfiles
COPY requirements.txt /dotfiles/
RUN pip install -r requirements.txt

COPY . /dotfiles/docs/
ENTRYPOINT ["mkdocs"]
CMD ["serve", "-a", "localhost:8001"]