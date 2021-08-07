from setuptools import find_packages, setup

dependencies = [
    "Flask==2.0.1",
    "environs==9.3.2",
    "Flask-MySQL==1.5.2",
    "mysql-connector==2.2.9",
    "cryptography==3.4.7",
    "flask-wtf==0.15.1",
    "flask-login==0.5.0",
    "flask-principal==0.4.0",
    "email-validator==1.1.3"
]

test_dependencies = [
    "black==21.7b0",
    "coveralls==3.2.0",
    "pytest==6.2.4",
    "tox==3.24.1",
    "isort==5.9.3",
    "pytest-cov==2.12.1",
    "flake8==3.9.2",
]

setup(
    name="PDS_Project",
    packages=find_packages(),
    verions="0.1.0",
    description="Final project for CS-GY 6083 Principles of Database Systems",
    author="Alex Biehl",
    license="MIT",
    install_requires=dependencies,
    setup_requires=["isort", "seed-isort-config==2.2.0"],
    include_package_data=True,
    tests_requires=test_dependencies,
    test_suite="tests",
)
