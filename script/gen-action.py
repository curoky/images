#!/usr/bin/env python3

import typer
import jinja2
import logging
from typer import secho
from pathlib import Path
from typing import Dict, List
from dataclasses import dataclass

app = typer.Typer(add_completion=False, help='')
root = Path(__file__).parent.parent
template = jinja2.Template((Path(__file__).parent / 'action.yaml.j2').read_text())


@dataclass
class Header:
    name: str
    os: List[str]
    version: List[str]
    depend: List[str]
    # post: List[str] = []


def parseHeader(name, build_content: str, file_content: str) -> Header:
    os = []
    version = []
    depend = set()
    for line in build_content.split('\n')[:5]:
        if 'os' in line:
            os = line.split(':', maxsplit=1)[1].strip().split(',')
        if 'version' in line:
            version = line.split(':', maxsplit=1)[1].strip().split(',')
    for line in file_content.split('\n'):
        if (line.startswith('FROM') or line.startswith('ARG')) and 'curoky/' in line:
            depend.add(line.split(':')[0].split('/')[1])
    return Header(name=name, os=os, version=version, depend=list(depend))


@app.command()
def gen():
    secho(f'ROOT: {root}')
    headers: List[Header] = []
    for dockerfile in root.glob('**/Dockerfile'):
        path = dockerfile.parent
        if path.name in ['gcc', 'jupyter']:
            continue
        secho(f'process {path.relative_to(root)}')

        headers.append(
            parseHeader(path.name, (path / 'build.sh').read_text(),
                        (path / 'Dockerfile').read_text()))

    # posts: Dict[str, List[str]] = {}
    # for header in headers:
    #     for d in header.depend:
    #         if d in posts:
    #             posts[d].append(header.name)
    #         else:
    #             posts[d] = [header.name]
    # for header in headers:
    #     header.post = posts[header.name]

    output = root / f'.github/workflows/build.yaml'
    output.write_text(template.render(headers=headers))


if __name__ == "__main__":
    logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)
    app()
