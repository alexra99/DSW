<<<<<<< HEAD
document.getElementById('change-theme-btn').addEventListener('click', function() {
    let darkThemeEnabled = document.body.classList.toggle('dark-theme');
    localStorage.setItem('dark-theme-enabled', darkThemeEnabled);
});

if (JSON.parse(localStorage.getItem('dark-theme-enabled'))) {
    document.body.classList.add('dark-theme');
=======
document.getElementById('change-theme-btn').addEventListener('click', function() {
    let darkThemeEnabled = document.body.classList.toggle('dark-theme');
    localStorage.setItem('dark-theme-enabled', darkThemeEnabled);
});

if (JSON.parse(localStorage.getItem('dark-theme-enabled'))) {
    document.body.classList.add('dark-theme');
>>>>>>> fb62ab5c6a0e03919c8288efe70b682b1d10850c
}