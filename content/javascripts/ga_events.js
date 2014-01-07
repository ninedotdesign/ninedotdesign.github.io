$(document).ready(function() {
  trackGAEventOnClick('#js-ga-home-partners-1', 'Homepage - Partners Boxes', 'Click', 'Product or Solution Builders');
  trackGAEventOnClick('#js-ga-home-partners-2', 'Homepage - Partners Boxes', 'Click', 'System Integrators');
  trackGAEventOnClick('#js-ga-home-partners-3', 'Homepage - Partners Boxes', 'Click', 'Component Manufacturers');
  trackGAEventOnClick('#tech-tab-toggle', 'Partners - Tabs', 'Click', 'Technology Partners Program');
  trackGAEventOnClick('#integ-tab-toggle', 'Partners - Tabs', 'Click', 'Integrators Program');
  trackGAEventOnClick('#js-ga-find-out-more-tech', 'Partners - Find out more', 'Click', 'Technology Partners Program');
  trackGAEventOnClick('#js-ga-find-out-more-integ', 'Partners - Find out more', 'Click', 'Integrators Program');
  trackGAEventOnClick('#js-ga-partner-contactus', 'Partners - Contact us now', 'Click', 'Partner');
  trackGAEventOnClick('#js-ga-partner-contactus-tech', 'Partners - Contact us now', 'Click', 'Technology');
  trackGAEventOnClick('#js-ga-partner-contactus-integ', 'Partners - Contact us now', 'Click', 'Integrator');
  trackGAEventOnClick('#js-ga-pricing-developer-signup', 'Pricing - Developer', 'Click', 'Start Building Now');
  trackGAEventOnClick('#js-ga-pricing-commercial-starter', 'Pricing - Commercial', 'Click', 'Learn More - Starter');
  trackGAEventOnClick('#js-ga-pricing-commercial-value', 'Pricing - Commercial', 'Click', 'Learn More - Value');
  trackGAEventOnClick('#js-ga-pricing-commercial-select', 'Pricing - Commercial', 'Click', 'Learn More - Select');
  trackGAEventOnClick('#js-ga-contactus-share-mailto', 'Contact Us - Share', 'Click', 'Tell us about it!');
  trackGAEventOnClick('#js-ga-contactus-feedback-mailto', 'Contact Us - Feedback', 'Click', 'how we are doing');
  trackGAEventOnClick('#js-ga-dev-kits-buy-america', 'Dev - Kits', 'Click', 'Purchase in North America');
  trackGAEventOnClick('#js-ga-dev-kits-buy-europe', 'Dev - Kits', 'Click', 'Purchase from Europe');
  trackGAEventOnClick('#js-ga-dev-libraries-mailto', 'Dev - Libraries', 'Click', 'Let us know');
  trackGAEventOnClick('#js-ga-jobs-applynow', 'Jobs', 'Click', 'Apply Now');
  trackGAEventOnClick('#js-ga-dev-hardware-econais', 'Dev - Hardware', 'Click', 'http://econais.com');
  trackGAEventOnClick('#js-ga-dev-hardware-mbed', 'Dev - Hardware', 'Click', 'http://mbed.org');
  trackGAEventOnClick('#js-ga-dev-hardware-tst', 'Dev - Hardware', 'Click', 'https://tst-sistemas.es');
  trackGAEventOnClick('#js-ga-dev-hardware-arduino', 'Dev - Hardware', 'Click', 'http://www.arduino.cc');
  trackGAEventOnClick('#js-ga-dev-hardware-electricimp', 'Dev - Hardware', 'Click', 'http://electricimp.com');
  trackGAEventOnClick('#js-ga-dev-hardware-filter-prototyping', 'Dev - Hardware', 'Click', 'Prototyping Solutions');
  trackGAEventOnClick('#js-ga-dev-hardware-filter-commercial', 'Dev - Hardware', 'Click', 'Commercial Solutions');
  trackGAEventOnClick('#js-ga-dev-tutorials-mbed-import', 'Dev - Tutorials - mbed', 'Click', 'Click Here to Import the Xively mbed Jumpstart Demo');

  $.each($('.js-ga-faqs li h3'), function(index, el){
    trackGAEventOnClick($(el), 'FAQs', 'Click', $(el).text());
  });
});
