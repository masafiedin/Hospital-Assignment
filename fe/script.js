let signup_btn = document.getElementById('signup');
let signin_btn = document.getElementById('signin')
signup_btn.addEventListener('click', submitForm);
signin_btn.addEventListener('click', signin);

function signup() {

    let email = document.getElementById('email_signup').value;
    let password = document.getElementById('password_signup').value;
    let name = document.getElementById('name_signup').value;
    let dob = document.getElementById('dob').value;
    let type = document.getElementById('type').value;

    let data = new FormData();
    data.append('email', email);
    data.append('password', password);
    data.append('name', name);
    data.append('dob', dob);
    data.append('type', type);

    
    axios({
        "method": "post",
        "url": "http://localhost/hospitalAssignment/be/signup.php",
        "data": data
    }).then((result) => {
        console.log(result)
        if (result.data.status == "success") {
            alert("signed up")
        }
    }).catch((err) => {
        console.error(err)
    });



function signin() {
    let username = document.getElementById('username_signin').value;
    let password = document.getElementById('password_signin').value;
    let data = new FormData();
    data.append('username', username);
    data.append('password', password);
    axios.post('http://localhost/HospitalAssignment/be/login.php', data).then(function (res) {
        console.log(res.data)
        // window.localStorage.setItem('user_id', res.data.user_id)
        // window.sessionStorage.setItem('user_id', res.data.user_id)
        console.log(window.sessionStorage.getItem('user_id'))

    }).catch(function (err) {
        console.log(err);
    })

}


function submitForm() {
    validateForm();
    if (formCheckPassed != 1) {
      return false;
    }else{
      signup();

    }
  }
  
  function validateForm() {
    //Calling a function during form submission.
  
    const passRegex = /^(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$/;
    const emailregex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  

    let email = document.getElementById('email_signup').value;
    let password = document.getElementById('password_signup').value;
    let name = document.getElementById('name_signup').value;
    let dob = document.getElementById('dob').value;
  
    if (name == "") {
      alert("Name must be filled out");
      return false;
    }
    if (dob == "") {
      alert("user Name must be filled out");
      return false;
    }
    if (!emailregex.test(email)) {
      alert("Please input a valid email address!");
      return false;
    }
    if (!passRegex.test(password)) {
      alert(
        "Password Invalid, should be at least 8 characters,has at least 1 number, 1 uppercase letter, & 1 non alpha-numeric character"
      );
      return false;
    }

    formCheckPassed = 1;
  }

}