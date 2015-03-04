//test file
var strings = ['Дао ', 'Дао ', 'пусто ', 'пусто ', 'но ', 'но ', 'в ',
    'в ','в ','в ', 'применении ', 'неисчерпаемо. ','неисчерпаемо. '];

function unique(arr) {
    var obj = {};
    var x = 0;
    for(x; x<arr.length; x++) {
        var str = arr[x];
        obj[str] = true; // запишет строку в виде свойства объекта
    }
    return Object.keys(obj); // или собрать ключи перебором
}

console.log( unique(strings).join(" . ") );