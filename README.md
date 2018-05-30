# Guru

Три задачки для тестового в рекламное агенство. 

### Задача на SQL:

Есть три таблицы:

1. Справочник категорий (id, name). 
Тут просто лежат названия категорий и айдишки, ничего сложного.

2. Справочник сущностей (id, category_id, name). 
Сущности, как я понимаю, что-то вроде подкатегорий или типов транзакций, но для нас они просто склейка между таблицами. Внутри одной категории может быть несколько сущностей, а к одной сущности может относиться несколько операций.

3. Основная таблица записи операций (id, date_time, item_id, cost, revenue, profit). 
Здесь item_id=id сущности, а profit это cost-revenue. Также сказано, что прибыль функционально зависит от цен покупки и продажи, таблица умышленно денормализована для упрощения выборок (кажется, это просто пояснение колонки profit).

![пример данных 3 таблицы](https://lh6.googleusercontent.com/zsGgVW52RSU0yxrR0SNaf9WwGgtOWKbXoExIuYLoQ7NzPwcKVOT-MhS7nGdYvb7w0sXrQ2Dq-iqMdZtATKL7sfrQZT69_8vVjsLT5QK2k0cZfz93nwNEJVvAM5w7oIWKNSvq2_uV)

## Задача:

получить топ-10 по прибыльности операций за текущий день в разрезе категорий.


### Задача на статистику:

Представлено 200 измерений (первые 200 строк), каждое содержит 
значение 5 признаков(A,B,C,D,E) и 1 показатель (R).

![пример данных](http://dl4.joxi.net/drive/2018/05/24/0021/3146/1432650/50/b62f95e2c1.png)

## Задача:

1. построить модель зависимости показателя от признаков 
(подсказка: не все из признаков могут влиять на показатель),

2. предсказать значение показателя на основе значений признаков для последних 10 строк.


### Задачка на логику:

Василий каждый день приходит на работу в офис. 
Каждый раз когда Василий заходит в свой кабинет в офисе раздаётся звук кукушки, 
оповещающий сотрудников о начале рабочего дня. 

## Задача:

Является ли приход Василия на работу причиной звука кукушки? 
Как можно доказать наличие или отсутствие причинно-следственной связи? 
                


The Jupyter notebook is a web-based notebook environment for interactive
computing.

![Jupyter notebook example](docs/resources/running_code_med.png "Jupyter notebook example")

### Jupyter notebook, the language-agnostic evolution of IPython notebook
Jupyter notebook is a language-agnostic HTML notebook application for
Project Jupyter. In 2015, Jupyter notebook was released as a part of
The Big Split™ of the IPython codebase. IPython 3 was the last major monolithic
release containing both language-agnostic code, such as the *IPython notebook*,
and language specific code, such as the *IPython kernel for Python*. As
computing spans across many languages, Project Jupyter will continue to develop the
language-agnostic **Jupyter notebook** in this repo and with the help of the
community develop language specific kernels which are found in their own
discrete repos.
[[The Big Split™ announcement](https://blog.jupyter.org/the-big-split-9d7b88a031a7)]
[[Jupyter Ascending blog post](https://blog.jupyter.org/jupyter-ascending-1bf5b362d97e)]

## Installation
You can find the installation documentation for the
[Jupyter platform, on ReadTheDocs](https://jupyter.readthedocs.io/en/latest/install.html).
The documentation for advanced usage of Jupyter notebook can be found
[here](https://jupyter-notebook.readthedocs.io/en/latest/).

For a local installation, make sure you have
[pip installed](https://pip.readthedocs.io/en/stable/installing/) and run:

    $ pip install notebook

## Usage - Running Jupyter notebook

### Running in a local installation

Launch with:

    $ jupyter notebook

## Development Installation

See [`CONTRIBUTING.rst`](CONTRIBUTING.rst) for how to set up a local development installation.

## Contributing

If you are interested in contributing to the project, see [`CONTRIBUTING.rst`](CONTRIBUTING.rst).

## Resources
- [Project Jupyter website](https://jupyter.org)
- [Online Demo at try.jupyter.org](https://try.jupyter.org)
- [Documentation for Jupyter notebook](https://jupyter-notebook.readthedocs.io/en/latest/) [[PDF](https://media.readthedocs.org/pdf/jupyter-notebook/latest/jupyter-notebook.pdf)]
- [Korean Version of Installation](https://github.com/ChungJooHo/Jupyter_Kor_doc/)
- [Documentation for Project Jupyter](https://jupyter.readthedocs.io/en/latest/index.html) [[PDF](https://media.readthedocs.org/pdf/jupyter/latest/jupyter.pdf)]
- [Issues](https://github.com/jupyter/notebook/issues)
- [Technical support - Jupyter Google Group](https://groups.google.com/forum/#!forum/jupyter)
