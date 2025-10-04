
const createOdometer = (el, value) => {
  const odometer = new Odometer({
    el: el,
    value: 0,
  });

  let hasRun = false;

  const options = {
    threshold: [0, 0.9],
  };

  const callback = (entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        if (!hasRun) {
          odometer.update(value);
          hasRun = true;
        }
      }
    });
  };

  const observer = new IntersectionObserver(callback, options);
  observer.observe(el);
};

const subscribersOdometer = document.querySelector(".number50");
createOdometer(subscribersOdometer, 50);

const videosOdometer = document.querySelector(".number20");
createOdometer(videosOdometer, 20);

const projectsOdometer = document.querySelector(".number18");
createOdometer(projectsOdometer, 18);