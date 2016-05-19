# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
#
puts "Creating Admin"
Optimadmin::Administrator.create!(
  username: 'optimised', email: 'support@optimised.today',
  password: 'optipoipoip', password_confirmation: 'optipoipoip', role: 'master')

puts "Creating main navigation"
wellbeing_zone = Optimadmin::ModulePage.create!(name: "WellBeing Zone", route: "wellbeing_path")
wellbeing_zone_link = Optimadmin::Link.create!(menu_resource: wellbeing_zone)
wellbeing_menu_item = Optimadmin::MenuItem.create!(link: wellbeing_zone_link, name: "Wellbeing Zone", menu_name: "header")

puts "creating videos"
video = Video.create!(title: "Ain't no sunshine", youtube_identifier: "tIdIqbv7SPo") # used in additional home content

puts "creating additional home content"
text_content = <<-RUBY
  <ul>
    <li>We prevent people going off work</li>
    <li>Getting people back to work</li>
    <li>Keeping people fit and well</li>
  </ul>
RUBY
AdditionalHomeContent.create!(title: "What we do", content_type: "text_content", content: text_content)
AdditionalHomeContent.create!(title: "b", video: video, content_type: "video_content")
AdditionalHomeContent.create!(title: "ROI Savings Calculator", content_type: "savings_calculator")

puts "Creating banners"
Banner.create!(title: "Banner", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")))
Banner.create!(title: "Banner with summary", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), summary: "Summary text")
Banner.create!(title: "Banner with link", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), link: "http://www.google.co.uk")

puts "Creating Quick Links"
8.times do
  EmployerQuickLink.create!(link: "http://www.google.co.uk", link_text: "Read more")
  EmployeeQuickLink.create!(link: "http://www.google.co.uk", link_text: "Read more")
end

puts "Creating service standards"
ServiceStandard.create!(icon: "clock", content: "Patients receive personal attention within four hours", hover_content: "We provide a single point of contact for the provision of physiotherapy care")
ServiceStandard.create!(icon: "calendar", content: "Guaranteed treatment within three days", hover_content: "Much quicker than the national average of 12 weeks")
ServiceStandard.create!(icon: "map_pin", content: "Easy to access clinics within 30 minutes travelling", hover_content: "700 clinics and 2,500 chartered physiotherapists nationwide")
ServiceStandard.create!(icon: "flexible", content: "Flexible treatment options to suit each patient",hover_content: "Hands on treatment, support and condition management")
ServiceStandard.create!(icon: "document", content: "High quality patient support resources", hover_content: "Online patient treatment centre.  Narrated videos for specific injuries.  Illustrated exercise guides")
ServiceStandard.create!(icon: "stopwatch", content: "Fast and safe patient recovery time", hover_content: "On average patients are fit to return to work in ten days")
ServiceStandard.create!(icon: "heart", content: "Post injury care", hover_content: "After care health and wellbeing support includes access to educational and exercise material")

puts "Creating practices"
Practice.create!(name: "Hull", post_code: "HU1 1NQ")

puts "Creating clients"
client = Client.create!(name: "Client 1", logo: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), display: true)
Client.create!(name: "Client 2", logo: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), display: true)

puts "Creating case studies"
CaseStudy.create!(title: "Case Study #1", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), summary: "Some content", content: "Some more content", display: true, date: Date.yesterday) 
CaseStudy.create!(title: "Case Study #2", summary: "A longer summary... let's shorten me because I am going to be way too long blah blah blah blah blah blah", content: "Some content", display: true, date: Date.today)

puts "Creating testimonials"
Testimonial.create!(title: "My title", content: "Some content", author: "John Simms")
Testimonial.create!(title: "Testimonial 2", content: "Some content", author: "Beth Norman")

puts "Creating team members"
team_member = TeamMember.create!(forename: "Joe", surname: "Bloggs", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), bio: "Biography", email: "joe.bloggs@example.com", phone: "01234 567890", role: "Some role")
TeamMember.create!(forename: "Jane", surname: "Bloggs", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), bio: "Biography", email: "jane.bloggs@example.com", phone: "01234 567890", role: "Some role")

puts "Creating articles"
Article.create!(title: "Article 1", image: File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")), summary: "Summary", content: "Content", date: Date.today, author: team_member)
Article.create!(title: "Article 2", summary: "Summary", content: "Content", date: Date.today)
Article.create!(title: "Article 3", summary: "Summary", content: "Content", date: Date.today)
Article.create!(title: "Article 4", summary: "Summary", content: "Content", date: Date.today)

puts "Creating body parts"
lower_back_intro = <<-RUBY
<h1 class="subtitle">If you suffer from lower back pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Whether you have lower back pain because of a herniated disc, osteoarthritis, or any other issue that is seriously impairing your outlook on life and your happiness, worry no more. We aim to provide a solution to you and to your problem, as well as supply information that will help you stay healthy and pain free after your injury is corrected.</strong></p>
<p>After all, there is no reason for you to live life hunched over in pain, there is too much to see, feel and experience when you are able to stand tall.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="/body-parts">Know Your Body</a> section where you will find various resources on the types of back injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain.</p>
<p><strong><a href="/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

hip_intro = <<-RUBY
<h1 class="subtitle">If you suffer from hip pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>A hip injury is nothing to joke about, it is one of the most serious injuries a person can suffer from and one that can lead to long term health problems if not addressed correctly or prevented. Athletes who play active sports like football and rugby are more prone to suffering a hip injury than athletes in other sports, however, hip injuries can also occur by accident, whether through a bad fall or quick and awkward movement. Therefore, you must know how to take care of yourself so you do not fall victim to this debilitating injury.</strong></p>
<p>Remember, good health and a little prevention now will protect this sensitive area as you age. We want to be there with you to proactively protect and prevent against hip injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="/body-parts">Know Your Body</a> section where you will find various resources on the types of hip injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain.</p>
<p><strong><a href="/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

knee_intro = <<-RUBY
<h1 class="subtitle">If you suffer from knee pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>The knee is a sensitive area of the body and one that can be injured doing almost any activity. The knee is normally exposed and vulnerable and a simple twist can lead to a serious injury as well as ongoing problems and a long recovery time. Therefore, whether your sport is rugby or racquetball, bowling or badminton, you cannot take chances with this body part.</strong></p>
<p>Our full <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section has everything you need to know about preventing or correcting a knee injury. It is our goal to provide you with resources, exercises and other knee related information that will allow you to learn about how easily this sensitive area can be injured.</p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid physiotherapy and other painful and time consuming tasks that come with nursing a knee injury.</p>
<p>Remember, good health and a little prevention now will protect the knee as you age. We want to be there with you to proactively protect and prevent against knee injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of knee injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain.</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

shoulder_intro = <<-RUBY
<h1 class="subtitle">If you suffer from shoulder pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>A shoulder injury can happen in any sport, and shoulder pain can be brought on from something as simple as sleeping in the wrong position. Whether you have damaged your rotator cuff because you were a little too overzealous at badminton, or you are sore from trying to weed the garden and paint the garage in one afternoon, this is the part of our website that we have designed with you in mind.</strong></p>
<p>It is our aim to provide you with the information and tools to help you recover from a shoulder injury and to prevent future injuries from occurring.</p>
<p>When you have proper information about how to stay healthy, you will find that your playtime will be more rewarding, your sleep with be more sound and your daily grind won't wear you down.</p>
<p>Remember, good health and a little prevention now will protect this sensitive area as you age. We want to be there with you to proactively protect and prevent against shoulder injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of shoulder injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain.</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

wrist_intro = <<-RUBY
<h1 class="subtitle">If you suffer from wrist pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Wrist injuries are very common because we use our hands and arms for so many of our daily activities, and if we fall, it's most natural for us to put our hands out to catch ourselves or break the fall. Overuse injuries in the workplace occur frequently in jobs that are repetitive, as in working on a computer or on a line in a factory. Sports injuries to the wrist occur often, they can happen in almost any sport, and are likely to keep you off the field or court while you are healing.</strong></p>
<p>To help you to better understand wrist injuries, their rehab and possibly how to prevent them, we've put together a collection of resources for you to review.</p>
<p>Remember, good health and a little prevention now will protect this sensitive area as you age. We want to be there with you to proactively protect and prevent against wrist injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of wrist injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain.</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

ankle_intro = <<-RUBY
<h1 class="subtitle">If you suffer from ankle pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Our full Know Your Body section has everything you need to know about preventing or correcting an ankle injury. It is our goal to provide you with resources, exercises and other ankle related information that will allow you to learn about how easily this sensitive area can be injured</strong></p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid painful and time consuming tasks that come with nursing an ankle injury.</p>
<p>Remember, good health and a little prevention now will protect your ankle as you age. We want to be there with you to proactively protect and prevent against ankle injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of ankle injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

foot_intro = <<-RUBY
<h1 class="subtitle">If you suffer from foot pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Our full Know Your Body section has everything you need to know about preventing or correcting a foot injury. It is our goal to provide you with resources, exercises and other foot related information that will allow you to learn about how easily this sensitive area can be injured</strong></p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid painful and time consuming tasks that come with nursing a foot injury.</p>
<p>Remember, good health and a little prevention now will protect your foot as you age. We want to be there with you to proactively protect and prevent against foot injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of foot injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

lower_leg_intro = <<-RUBY
<h1 class="subtitle">If you suffer from lower leg pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Our full Know Your Body section has everything you need to know about preventing or correcting a lower leg injury. It is our goal to provide you with resources, exercises and other lower leg related information that will allow you to learn about how easily this sensitive area can be injured</strong></p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid painful and time consuming tasks that come with nursing a lower leg injury.</p>
<p>Remember, good health and a little prevention now will protect your lower leg as you age. We want to be there with you to proactively protect and prevent against lower leg injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of lower leg injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

elbow_intro = <<-RUBY
<h1 class="subtitle">If you suffer from elbow pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Our full Know Your Body section has everything you need to know about preventing or correcting an elbow injury. It is our goal to provide you with resources, exercises and other elbow related information that will allow you to learn about how easily this sensitive area can be injured</strong></p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid painful and time consuming tasks that come with nursing an elbow injury.</p>
<p>Remember, good health and a little prevention now will protect your elbow as you age. We want to be there with you to proactively protect and prevent against elbow injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of elbow injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain</p>
<p><strong><a href="http://www.phyiosmed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

neck_intro = <<-RUBY
<h1 class="subtitle">If you suffer from neck pain, there is no reason why you have to stay in pain. In fact, we have designed this portion of our site with you in mind.</h1>
<p>&nbsp;</p>
<p><strong>Our full Know Your Body section has everything you need to know about preventing or correcting a neck injury. It is our goal to provide you with resources, exercises and other neck related information that will allow you to learn about how easily this sensitive area can be injured</strong></p>
<p>When you take the necessary steps in preventing an injury, you will enjoy your chosen sport more and avoid painful and time consuming tasks that come with nursing a neck injury.</p>
<p>Remember, good health and a little prevention now will protect your ankle as you age. We want to be there with you to proactively protect and prevent against neck injuries.</p>
<p>If you are a customer of Physio Med you will have access to our <a href="http://www.physiomed.co.uk/know-your-body">Know Your Body</a> section where you will find various resources on the types of neck injuries that you could suffer from as well as information about the steps that should be taken for fixing this problem.</p>
<p>Take the time and make sure you get proper attention; after all, you have better things to do than stay in pain</p>
<p><strong><a href="http://www.physiomed.co.uk/contacts/new">Contact Physio Med</a> for further details.</strong></p>
RUBY

body_parts = [
  { name: "Lower Back", introduction: lower_back_intro },
  { name: "Hip", introduction: hip_intro },
  { name: "Knee", introduction: knee_intro },
  { name: "Shoulder", introduction: shoulder_intro },
  { name: "Wrist", introduction: wrist_intro },
  { name: "Ankle", introduction: ankle_intro },
  { name: "Foot", introduction: foot_intro },
  { name: "Lower Leg", introduction: lower_leg_intro },
  { name: "Elbow", introduction: elbow_intro },
  { name: "Neck", introduction: neck_intro }
]
