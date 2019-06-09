## Python
### simple setup.py
```
import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="package_name",
    version="0.1.2",
    author="Abolfazl Amiri",
    author_email="aa.smpro@gmail.com",
    description="simple description",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/aasmpro/simplesm",
    packages=setuptools.find_packages(),
    classifiers=[
        "License :: OSI Approved :: GNU General Public License v3 (GPLv3)",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3 :: Only"
    ],
)
```

### packaging for pypi
install `twine`:
```
pip3 install twine
```
building package:
```
python3 setup.py sdist bdist_wheel
```
__testing package:__

looking what is inside package:
```
tar tzf package-1.2.3.tar.gz
```
cheching all dists:
```
twine check dist/*
```
uploading to test repository:
```
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```
or real upload to pypi:
```
twine upload dist/*
```

### resources
[this](https://realpython.com/pypi-publish-python-package/) is helpful!
