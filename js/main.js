(function () {
  'use strict';

  // Mobile navigation toggle
  var hamburger = document.querySelector('.hamburger');
  var navMenu = document.querySelector('nav ul');

  if (hamburger && navMenu) {
    hamburger.addEventListener('click', function () {
      navMenu.classList.toggle('open');
      hamburger.setAttribute('aria-expanded', navMenu.classList.contains('open'));
    });

    // Close menu when a link is clicked
    navMenu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        navMenu.classList.remove('open');
        hamburger.setAttribute('aria-expanded', 'false');
      });
    });

    // Close menu when clicking outside
    document.addEventListener('click', function (e) {
      if (!e.target.closest('nav')) {
        navMenu.classList.remove('open');
        hamburger.setAttribute('aria-expanded', 'false');
      }
    });
  }

  // Scroll-to-top button
  var scrollBtn = document.getElementById('scroll-top');

  if (scrollBtn) {
    window.addEventListener('scroll', function () {
      if (window.scrollY > 400) {
        scrollBtn.classList.add('visible');
      } else {
        scrollBtn.classList.remove('visible');
      }
    });

    scrollBtn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  // Image upgrade: try .jpg, fall back to .svg
  document.querySelectorAll('.card img').forEach(function (img) {
    var svgSrc = img.getAttribute('src');
    if (svgSrc && svgSrc.endsWith('.svg')) {
      var jpgSrc = svgSrc.replace(/\.svg$/, '.jpg');
      var test = new Image();
      test.onload = function () { img.src = jpgSrc; };
      test.src = jpgSrc;
    }
  });

  // Hero background: try .jpg, fall back to .svg
  var hero = document.getElementById('hero');
  if (hero) {
    var heroTest = new Image();
    heroTest.onload = function () {
      hero.style.backgroundImage = "url('images/hero.jpg')";
    };
    heroTest.src = 'images/hero.jpg';
  }

  // Fade-in sections on scroll
  var observer = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.08 });

  document.querySelectorAll('.card, .tuning-card, .size-card, .tl-item').forEach(function (el) {
    el.classList.add('fade-in');
    observer.observe(el);
  });
}());
