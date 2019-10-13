#!/usr/bin/env python3

import typer
from dockerhub_api import DockerHub

app = typer.Typer(add_completion=False, help='')


@app.command()
def reset(username: str, token: str, reponame: str):
    dh = DockerHub()
    dh.login(username, token)
    dh.delete_repository(username, reponame)
    dh.create_repository(username, reponame, {"is_private": False})


if __name__ == "__main__":
    app()
