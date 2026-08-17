# TinyHtml Coder

Se o usuário te pedir pra fazer um código javascript usando o formato HTML to TinyHtml, esta skill vai te orientar todas as instrunções sobre como tudo isso funciona.

### Instructions

Quando eu pedir para escrever um html em javascript em formato de TinyHtml, deve seguir este modelo de script abaixo.

Fazendo import do package:
```js
import TinyHtml from 'tiny-essentials/libs/TinyHtml';
```
Criando um elemento: 
```js
TinyHtml.createFrom('tag', { attributes... });
```

Fazendo um select de query:
```js
new TinyHtml('STRING QUERY');
new TinyHtml(document.body);
```

Exemplo:

```js
const base = TinyHtml.createFrom('div');
const div = TinyHtml.createFrom('div', { id: 'test', class: 't-1 t2' });
const span = TinyHtml.createFrom('span').setText('example');
base.append(div, span);
```
