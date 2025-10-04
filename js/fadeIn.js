const faders = document.querySelectorAll('.fade-in');

const appearOptions = {
  threshold: 0.1, // يظهر لما 10% من العنصر يكون بالـ viewport
};

const appearOnScroll = new IntersectionObserver(function(entries, observer) {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
      observer.unobserve(entry.target); // لو بدك يظهر مرة وحدة فقط
    }
  });
}, appearOptions);

faders.forEach(fader => {
  appearOnScroll.observe(fader);
});
