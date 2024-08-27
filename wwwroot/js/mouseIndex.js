const follower = document.getElementById('mouse-follower');
let followerX = window.innerWidth / 2, followerY = window.innerHeight / 2;
let mouseX = followerX, mouseY = followerY;
const speed = 0.02;  
let lastX = followerX; 

document.addEventListener('mousemove', (e) => {
    mouseX = e.clientX;
    mouseY = e.clientY;
});

function animateFollower() {

    followerX += (mouseX - followerX) * speed;
    followerY += (mouseY - followerY) * speed;

    follower.style.left = followerX + 'px';
    follower.style.top = followerY + 'px';

    if (followerX < lastX) {

        follower.style.transform = 'translate(-50%, -50%) rotateY(180deg)';
    } else {
        follower.style.transform = 'translate(-50%, -50%) rotateY(0deg)';
    }
    lastX = followerX;

    requestAnimationFrame(animateFollower);
}

animateFollower();