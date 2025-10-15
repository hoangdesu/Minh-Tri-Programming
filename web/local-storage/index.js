console.log('Hello from index.js');

// localStorage is a global variable

// window: top-level object for JS

// window.localStorage

// localStorage: 
//     - hashmap / dictionary / object data structure
//     - "key: value" pairs
//     - values in localstorage can ONLY be string


// JS object:

const tri = {
    name: {
        first: 'Trí',
        last: 'Đỗ'
    },
    birthYear: 2008,
    hobbies: ['bouldering', 'eating', 'milktea'],
};

console.log(tri);

console.log(tri.hobbies[0]);



localStorage.setItem('name', 'trí');
localStorage.setItem('fav_num', 26); // str "26"
localStorage.setItem('isHappy', true);


// localStorage.setItem('hobbies', tri.hobbies); // => toString: "bouldering,eating,milktea"
// localStorage.setItem('tri', tri); // => [object Object]

// if u wanna store something than a primitive type (str, num), 
// => you should cast that object/list to JSON string to store in localStorage

// list/object -> str
localStorage.setItem('hobbies', JSON.stringify(tri.hobbies)); // => toString: "["bouldering","eating","milktea"]"
localStorage.setItem('tri', JSON.stringify(tri)); // 1 big string: '{"name":{"first":"Trí","last":"Đỗ"},"birthYear":2008,"hobbies":["bouldering","eating","milktea"]}'


// Data retrieval from localStorage: only need to provide a key
const local_hobbies = localStorage.getItem('hobbies'); // str

console.log(local_hobbies); // '["bouldering","eating","milktea"]'
console.log(local_hobbies[0]);

// str -> list/object
const local_hobbies_list = JSON.parse(local_hobbies);
console.log(local_hobbies_list[0]);


const tri_object = JSON.parse(localStorage.getItem('tri'));
const age = 2025 - tri_object.birthYear;

console.log(age);

// accessing data in an object
console.log(tri_object['name']['first']); // bracket notation
console.log(tri_object.name.last);        // dot notation



const statusP = document.querySelector('#status');

const username = localStorage.getItem('username');
console.log(username);

if (username === 'tri') {
    statusP.textContent = 'You are logged in: ' + username;
} else {
    statusP.textContent = 'You are not logged in...';
}
