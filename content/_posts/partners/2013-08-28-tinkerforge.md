---

layout: partner
section: partner
active: partner
categories: ["partners"]

name: Tinkerforge
tags: ["Kit Manufacturer"]
image: partner_pages/tinkerforge/tinkerforge_logo.png
description: Tinkerforge is a German company making the handling of electronics easier by using electronic building blocks that are suitable for every application.

URL: http://www.tinkerforge.com/en/

---


<section class="dev-center">

  <section class="row">
    <div class="twelve columns">
      <h1 class="big-heading font-light key-message">Xively Partner: <strong>{{ page.name }}</strong></h1>
    </div>
  </section>

  <section class="row">
      <div class="columns three">
        <img src="{{ page.image | asset_path }}" />   
      </div>

      <div class="columns one"></div>

      <div class="columns eight">        
        <div class="row">
          <p>Tinkerforge is a German company making the handling of electronics easier by using electronic building blocks.</p>

          <p>These building blocks can be used professionally, as a hobby for the automation of processes or for the development of prototypes. A developer can build a system out of modules that are suitable for every application. Each module has one specific function, such as the controlling of a motor or the sensing of a temperature. The modules can be stacked on top of each other or connected with a cable. Communication over Wi-Fi, Ethernet or Modbus (RS485) is possible. The system is expendable at all times, additional modules can be added as they are needed.</p>
        </div>

        <div class="row">
          <a href="{{ page.URL }}" target="_blank" class="button orange medium">
            Go to partner's website <i class="button-icon icon-arrow-right"></i>
          </a>
        </div>
      </div>
  </section>

  <section class="dev-center row">

    <div class="twelve columns">

      <h3 class="dev-section-heading heading-medium">More on {{ page.name }}</h3>

      <div class="six columns">

        <p>Tinkerforge building blocks can be controlled from an (embedded) PC, smart phone or tablet. It does not matter which way the modules are interconnected, since each module is identified by its own unique ID. Thus modifications of the system, without changing the source code, are always possible. The Tinkerforge hardware is programmable in C, C++, C#, Delphi, Java, PHP, Python, Ruby and VB.NET, and more programming languages are on their way.</p>

    		<p>Both the hardware and software are open source. A professional product developer can build his first prototypes quickly by choosing the right modules. If the prototype fulfils his requirements he can begin to work on the final product by taking over the necessary software and hardware.</p>

    		<p>Tinkerforge was founded in 2011 as a two person company. In 2012 the computer magazine CHIP awarded Tinkerforge the "Product of the Year" award. Besides the development of the building block system Tinkerforge gained some experience in the development of custom soft- and hardware based on the building blocks for several industrial projects.</p>

      </div>

      <div class="six columns">
        <img src="{% asset_path partner_pages/tinkerforge/tinkerforge_building_blocks.jpg %}" />
      </div>

    </div>

  </section>


</section>
