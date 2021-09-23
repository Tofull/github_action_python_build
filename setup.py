from setuptools import Extension, find_packages, setup

with open("README.md") as readme_file:
    readme = readme_file.read()

with open("requirements.txt") as requirements_file:
    requirements = requirements_file.read().splitlines()


setup(
    name="any_app",
    version="0.0.2",
    description="Any python app",
    long_description=readme,
    author="Loïc Messal",
    author_email="loic.messal@jakarto.com",
    url="https://github.com/Tofull/github_action_python_build",
    packages=find_packages(include=["any_app*"]),
    package_data={"": ["*.pyx", "*.pxd"]},
    include_package_data=True,
    install_requires=requirements,
    tests_require=["pytest"],
    python_requires=">=3.7",
    license="MIT",
    zip_safe=False,
)