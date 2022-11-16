import React from 'react'
import { graphql } from 'gatsby'
import { Container } from 'theme-ui'
import Layout from '@solid-ui-layout/Layout'
import Seo from '@solid-ui-components/Seo'
import Divider from '@solid-ui-components/Divider'
import Header from '@solid-ui-blocks/Header/Block01'
import Footer from '@solid-ui-blocks/Footer/Block01'
import { normalizeBlockContentNodes } from '@blocks-helpers'
import styles from './_styles'

const Privacy = props => {
  const { allBlockContent } = props.data
  const content = normalizeBlockContentNodes(allBlockContent?.nodes)

  return (
    <Layout {...props}>
      <Seo title='Privacy Policy' />
      <Header content={content['header']} />
      <Divider space='5' />
      <Container p={20} sx={styles.contentTwoContainer}>
        <div style={{padding: '20px'}} >

      <h1 id="privacy-policy">PRIVACY POLICY</h1>
<h2 id="last-updated-november-01-2022">Last updated November 01, 2022</h2>
<p>This privacy notice for Misfitcoders ÖU (&quot; <strong>Company</strong> ,&quot; &quot;<strong>we</strong>,&quot;
    &quot;<strong>us</strong>,&quot; or &quot;<strong>our</strong>&quot; ), describes how and why we might collect,
    store, use, and/or share (&quot;<strong>process</strong>&quot;) your information when you use our services
    (&quot;<strong>Services</strong>&quot;), such as when you:</p>
<ul>
    <li>Download and use our mobile application (Ilurama) , or any other application of ours that links to this privacy
        notice</li>
    <li>Engage with us in other related ways, including any sales, marketing, or events</li>
</ul>
<p><strong>Questions or concerns?</strong> Reading this privacy notice will help you understand your privacy rights and
    choices. If you do not agree with our policies and practices, please do not use our Services. If you still have any
    questions or concerns, please contact us at <a
        href="mailto:&#115;&#x75;&#x70;&#112;&#111;&#114;&#x74;&#x40;&#109;&#x69;&#x73;&#x66;&#x69;&#116;&#x63;&#x6f;&#100;&#x65;&#x72;&#x73;&#x2e;&#x63;&#x6f;&#109;">&#115;&#x75;&#x70;&#112;&#111;&#114;&#x74;&#x40;&#109;&#x69;&#x73;&#x66;&#x69;&#116;&#x63;&#x6f;&#100;&#x65;&#x72;&#x73;&#x2e;&#x63;&#x6f;&#109;</a>
    .</p>
<h2 id="summary-of-key-points">SUMMARY OF KEY POINTS</h2>
<p><strong><em>This summary provides key points from our privacy notice, but you can find out more details about any of
            these topics by clicking the link following each key point or by using our table of contents below to find
            the section you are looking for.</em></strong></p>
<p><strong>What personal information do we process?</strong> When you visit, use, or navigate our Services, we may
    process personal information depending on how you interact with Misfitcoders ÖU and the Services, the choices you
    make, and the products and features you use.</p>
<p><strong>Do we process any sensitive personal information?</strong> We do not process sensitive personal information.
</p>
<p><strong>Do we receive any information from third parties?</strong> We do not receive any information from third
    parties.</p>
<p><strong>How do we process your information?</strong> We process your information to provide, improve, and administer
    our Services, communicate with you, for security and fraud prevention, and to comply with law. We may also process
    your information for other purposes with your consent. We process your information only when we have a valid legal
    reason to do so.</p>
<p><strong>In what situations and with which parties do we share personal information?</strong> We may share information
    in specific situations and with specific third parties.</p>
<p><strong>How do we keep your information safe?</strong> We have organizational and technical processes and procedures
    in place to protect your personal information. However, no electronic transmission over the internet or information
    storage technology can be guaranteed to be 100% secure, so we cannot promise or guarantee that hackers,
    cybercriminals, or other unauthorized third parties will not be able to defeat our security and improperly collect,
    access, steal, or modify your information.</p>
<p><strong>What are your rights?</strong> Depending on where you are located geographically, the applicable privacy law
    may mean you have certain rights regarding your personal information.</p>
<p><strong>How do you exercise your rights?</strong> The easiest way to exercise your rights is by filling out our data
    subject request form available here: <a href="https://ilurama.com/profile">https://ilurama.com/profile</a> , or by
    contacting us. We will consider and act upon any request in accordance with applicable data protection laws.</p>
<h2 id="table-of-contents">TABLE OF CONTENTS</h2>
<p>1. WHAT INFORMATION DO WE COLLECT?</p>
<p>2. HOW DO WE PROCESS YOUR INFORMATION?</p>
<p>3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR PERSONAL INFORMATION?</p>
<p>4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?</p>
<p>5. DO WE USE COOKIES AND OTHER TRACKING TECHNOLOGIES?</p>
<p>6. HOW DO WE HANDLE YOUR SOCIAL LOGINS?</p>
<p>7. HOW LONG DO WE KEEP YOUR INFORMATION?</p>
<p>8. HOW DO WE KEEP YOUR INFORMATION SAFE?</p>
<p>9. DO WE COLLECT INFORMATION FROM MINORS?</p>
<p>10. WHAT ARE YOUR PRIVACY RIGHTS?</p>
<p>11. CONTROLS FOR DO-NOT-TRACK FEATURES</p>
<p>12. DO CALIFORNIA RESIDENTS HAVE SPECIFIC PRIVACY RIGHTS?</p>
<p>13. DO WE MAKE UPDATES TO THIS NOTICE?</p>
<p>14. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?</p>
<p>15. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?</p>
<h2 id="1-what-information-do-we-collect">1. WHAT INFORMATION DO WE COLLECT?</h2>
<h3 id="personal-information-you-disclose-to-us">Personal information you disclose to us</h3>
<p><strong><em>In Short:</em></strong> <em>We collect personal information that you provide to us.</em></p>
<p>We collect personal information that you voluntarily provide to us when you register on the Services, express an
    interest in obtaining information about us or our products and Services, when you participate in activities on the
    Services, or otherwise when you contact us.</p>
<p><strong>Personal Information Provided by You.</strong> The personal information that we collect depends on the
    context of your interactions with us and the Services, the choices you make, and the products and features you use.
    The personal information we collect may include the following:</p>
<ul>
    <li>names</li>
    <li>email addresses</li>
</ul>
<p><strong>Sensitive Information.</strong> We do not process sensitive information.</p>
<p><strong>Social Media Login Data.</strong> We may provide you with the option to register with us using your existing
    social media account details, like your Facebook, Twitter, or other social media account. If you choose to register
    in this way, we will collect the information described in the section called &quot;HOW DO WE HANDLE YOUR SOCIAL
    LOGINS?&quot;
    below.</p>
<p>All personal information that you provide to us must be true, complete, and accurate, and you must notify us of any
    changes to such personal information.</p>
<h3 id="information-automatically-collected">Information automatically collected</h3>
<p><strong><em>In Short:</em></strong> <em>Some information — such as your Internet Protocol (IP) address and/or browser
        and device characteristics — is collected automatically when you visit our Services.</em></p>
<p>We automatically collect certain information when you visit, use, or navigate the Services. This information does not
    reveal your specific identity (like your name or contact information) but may include device and usage information,
    such as your IP address, browser and device characteristics, operating system, language preferences, referring URLs,
    device name, country, location, information about how and when you use our Services, and other technical
    information. This information is primarily needed to maintain the security and operation of our Services, and for
    our internal analytics and reporting purposes.</p>
<p>Like many businesses, we also collect information through cookies and similar technologies.</p>
<p>The information we collect includes:</p>
<ul>
    <li><em>Log and Usage Data.</em> Log and usage data is service-related, diagnostic, usage, and performance
        information our servers automatically collect when you access or use our Services and which we record in log
        files. Depending on how you interact with us, this log data may include your IP address, device information,
        browser type, and settings and information about your activity in the Services (such as the date/time stamps
        associated with your usage, pages and files viewed, searches, and other actions you take such as which features
        you use), device event information (such as system activity, error reports (sometimes called &quot;crash
        dumps&quot;), and hardware settings).</li>
</ul>
<h2 id="2-how-do-we-process-your-information">2. HOW DO WE PROCESS YOUR INFORMATION?</h2>
<p><strong><em>In Short:</em></strong> <em>We process your information to provide, improve, and administer our Services,
        communicate with you, for security and fraud prevention, and to comply with law. We may also process your
        information for other purposes with your consent.</em></p>
<p><strong>We process your personal information for a variety of reasons, depending on how you interact with our
        Services, including:</strong></p>
<ul>
    <li><strong>To facilitate account creation and authentication and otherwise manage user accounts.</strong> We may
        process your information so you can create and log in to your account, as well as keep your account in working
        order.</li>
    <li><strong>To deliver and facilitate delivery of services to the user.</strong> We may process your information to
        provide you with the requested service.</li>
    <li><strong>To respond to user inquiries/offer support to users.</strong> We may process your information to respond
        to your inquiries and solve any potential issues you might have with the requested service.</li>
    <li><strong>To send administrative information to you.</strong> We may process your information to send you details
        about our products and services, changes to our terms and policies, and other similar information.</li>
    <li><strong>To fulfill and manage your orders.</strong> We may process your information to fulfill and manage your
        orders, payments, returns, and exchanges made through the Services.</li>
    <li><strong>To enable user-to-user communications.</strong> We may process your information if you choose to use any
        of our offerings that allow for communication with another user.</li>
    <li><strong>To save or protect an individual&#39;s vital interest.</strong> We may process your information when
        necessary to save or protect an individual's vital interest, such as to prevent harm.</li>
</ul>
<h2 id="3-what-legal-bases-do-we-rely-on-to-process-your-information">3. WHAT LEGAL BASES DO WE RELY ON TO PROCESS YOUR
    INFORMATION?</h2>
<p><em><strong>In Short:</strong> We only process your personal information when we believe it is necessary and we have
        a valid legal reason (i.e. , legal basis) to do so under applicable law, like with your consent, to comply with
        laws, to provide you with services to enter into or fulfill our contractual obligations, to protect your rights,
        or to fulfill our legitimate business interests.</em></p>
<p><em><strong>If you are located in the EU or UK, this section applies to you.</strong></em></p>
<p>The General Data Protection Regulation (GDPR) and UK GDPR require us to explain the valid legal bases we rely on in
    order to process your personal information. As such, we may rely on the following legal bases to process your
    personal information:</p>
<ul>
    <li><strong>Consent.</strong> We may process your information if you have given us permission (i.e. , consent) to
        use your personal information for a specific purpose. You can withdraw your consent at any time.</li>
    <li><strong>Performance of a Contract.</strong> We may process your personal information when we believe it is
        necessary to fulfill our contractual obligations to you, including providing our Services or at your request
        prior to entering into a contract with you.</li>
    <li><strong>Legal Obligations.</strong> We may process your information where we believe it is necessary for
        compliance with our legal obligations, such as to cooperate with a law enforcement body or regulatory agency,
        exercise or defend our legal rights, or disclose your information as evidence in litigation in which we are
        involved. </li>
    <li><strong>Vital Interests.</strong> We may process your information where we believe it is necessary to protect
        your vital interests or the vital interests of a third party, such as situations involving potential threats to
        the safety of any person.
        In legal terms, we are generally the &quot;data controller&quot; under European data protection laws of the
        personal information described in this privacy notice, since we determine the means and/or purposes of the data
        processing we perform. This privacy notice does not apply to the personal information we process as a &quot;data
        processor&quot; on behalf of our customers. In those situations, the customer that we provide services to and
        with whom we have entered into a data processing agreement is the &quot;data controller&quot; responsible for
        your personal information, and we merely process your information on their behalf in accordance with your
        instructions. If you want to know more about our customers&#39; privacy practices, you should read their privacy
        policies and direct any questions you have to them.</li>
</ul>
<p><strong><em>If you are located in Canada, this section applies to you.</em></strong></p>
<p>We may process your information if you have given us specific permission (i.e. , express consent) to use your
    personal information for a specific purpose, or in situations where your permission can be inferred (i.e. , implied
    consent). You can withdraw your consent at any time.</p>
<p>In some exceptional cases, we may be legally permitted under applicable law to process your information without your
    consent, including, for example:</p>
<ul>
    <li>If collection is clearly in the interests of an individual and consent cannot be obtained in a timely way</li>
    <li>For investigations and fraud detection and prevention</li>
    <li>For business transactions provided certain conditions are met</li>
    <li>If it is contained in a witness statement and the collection is necessary to assess, process, or settle an
        insurance claim</li>
    <li>For identifying injured, ill, or deceased persons and communicating with next of kin</li>
    <li>If we have reasonable grounds to believe an individual has been, is, or may be victim of financial abuse</li>
    <li>If it is reasonable to expect collection and use with consent would compromise the availability or the accuracy
        of the information and the collection is reasonable for purposes related to investigating a breach of an
        agreement or a contravention of the laws of Canada or a province</li>
    <li>If disclosure is required to comply with a subpoena, warrant, court order, or rules of the court relating to the
        production of records</li>
    <li>If it was produced by an individual in the course of their employment, business, or profession and the
        collection is consistent with the purposes for which the information was produced</li>
    <li>If the collection is solely for journalistic, artistic, or literary purposes</li>
    <li>If the information is publicly available and is specified by the regulations</li>
</ul>
<h2 id="4-when-and-with-whom-do-we-share-your-personal-information">4. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL
    INFORMATION?</h2>
<p><strong><em>In Short:</em></strong> <em>We may share information in specific situations described in this section
        and/or with the following third parties.</em></p>
<p>We may need to share your personal information in the following situations:</p>
<ul>
    <li><strong>Business Transfers.</strong> We may share or transfer your information in connection with, or during
        negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our
        business to another company.</li>
</ul>
<h2 id="5-do-we-use-cookies-and-other-tracking-technologies">5. DO WE USE COOKIES AND OTHER TRACKING TECHNOLOGIES?</h2>
<p><strong><em>In Short:</em></strong> <em>We may use cookies and other tracking technologies to collect and store your
        information.</em></p>
<p>We may use cookies and similar tracking technologies (like web beacons and pixels) to access or store information.
    Specific information about how we use such technologies and how you can refuse certain cookies is set out in our
    Cookie Notice .</p>
<h2 id="6-how-do-we-handle-your-social-logins">6. HOW DO WE HANDLE YOUR SOCIAL LOGINS?</h2>
<p><strong><em>In Short:</em></strong> <em>If you choose to register or log in to our Services using a social media
        account, we may have access to certain information about you.</em></p>
<p>Our Services offer you the ability to register and log in using your third-party social media account details (like
    your Facebook or Twitter logins). Where you choose to do this, we will receive certain profile information about you
    from your social media provider. The profile information we receive may vary depending on the social media provider
    concerned, but will often include your name, email address, friends list, and profile picture, as well as other
    information you choose to make public on such a social media platform.</p>
<p>We will use the information we receive only for the purposes that are described in this privacy notice or that are
    otherwise made clear to you on the relevant Services. Please note that we do not control, and are not responsible
    for, other uses of your personal information by your third-party social media provider. We recommend that you review
    their privacy notice to understand how they collect, use, and share your personal information, and how you can set
    your privacy preferences on their sites and apps.</p>
<h2 id="7-how-long-do-we-keep-your-information">7. HOW LONG DO WE KEEP YOUR INFORMATION?</h2>
<p><strong><em>In Short:</em></strong> <em>We keep your information for as long as necessary to fulfill the purposes
        outlined in this privacy notice unless otherwise required by law.</em></p>
<p>We will only keep your personal information for as long as it is necessary for the purposes set out in this privacy
    notice, unless a longer retention period is required or permitted by law (such as tax, accounting, or other legal
    requirements). No purpose in this notice will require us keeping your personal information for longer than the
    period of time in which users have an account with us .</p>
<p>When we have no ongoing legitimate business need to process your personal information, we will either delete or
    anonymize such information, or, if this is not possible (for example, because your personal information has been
    stored in backup archives), then we will securely store your personal information and isolate it from any further
    processing until deletion is possible.</p>
<h2 id="8-how-do-we-keep-your-information-safe">8. HOW DO WE KEEP YOUR INFORMATION SAFE?</h2>
<p><strong><em>In Short:</em></strong> <em>We aim to protect your personal information through a system of
        organizational and technical security measures.</em></p>
<p>We have implemented appropriate and reasonable technical and organizational security measures designed to protect the
    security of any personal information we process. However, despite our safeguards and efforts to secure your
    information, no electronic transmission over the Internet or information storage technology can be guaranteed to be
    100% secure, so we cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third parties
    will not be able to defeat our security and improperly collect, access, steal, or modify your information. Although
    we will do our best to protect your personal information, transmission of personal information to and from our
    Services is at your own risk. You should only access the Services within a secure environment.</p>
<h2 id="9-do-we-collect-information-from-minors">9. DO WE COLLECT INFORMATION FROM MINORS?</h2>
<p><strong><em>In Short:</em></strong> <em>We do not knowingly collect data from or market to children under 18 years of
        age .</em></p>
<p>We do not knowingly solicit data from or market to children under 18 years of age. By using the Services, you
    represent that you are at least 18 or that you are the parent or guardian of such a minor and consent to such minor
    dependent's use of the Services. If we learn that personal information from users less than 18 years of age has been
    collected, we will deactivate the account and take reasonable measures to promptly delete such data from our
    records. If you become aware of any data we may have collected from children under age 18, please contact us at <a
        href="mailto:&#x73;&#117;&#112;&#x70;&#111;&#x72;&#x74;&#x40;&#109;&#x69;&#115;&#x66;&#x69;&#116;&#99;&#x6f;&#x64;&#x65;&#114;&#115;&#46;&#99;&#111;&#x6d;">&#x73;&#117;&#112;&#x70;&#111;&#x72;&#x74;&#x40;&#109;&#x69;&#115;&#x66;&#x69;&#116;&#99;&#x6f;&#x64;&#x65;&#114;&#115;&#46;&#99;&#111;&#x6d;</a>
    .</p>
<h2 id="10-what-are-your-privacy-rights">10. WHAT ARE YOUR PRIVACY RIGHTS?</h2>
<p><strong><em>In Short:</em></strong> <em>In some regions, such as the European Economic Area (EEA), United Kingdom
        (UK), and Canada , you have rights that allow you greater access to and control over your personal information.
        You may review, change, or terminate your account at any time.</em></p>
<p>In some regions (like the EEA, UK, and Canada ), you have certain rights under applicable data protection laws. These
    may include the right (i) to request access and obtain a copy of your personal information, (ii) to request
    rectification or erasure; (iii) to restrict the processing of your personal information; and (iv) if applicable, to
    data portability. In certain circumstances, you may also have the right to object to the processing of your personal
    information. You can make such a request by contacting us by using the contact details provided in the section
    &quot;HOW CAN YOU CONTACT US ABOUT THIS NOTICE?&quot;
    below.</p>
<p>We will consider and act upon any request in accordance with applicable data protection laws.
    If you are located in the EEA or UK and you believe we are unlawfully processing your personal information, you also
    have the right to complain to your local data protection supervisory authority. You can find their contact details
    here: <a
        href="https://ec.europa.eu/justice/data-protection/bodies/authorities/index_en.htm">https://ec.europa.eu/justice/data-protection/bodies/authorities/index_en.htm</a>.
</p>
<p>If you are located in Switzerland, the contact details for the data protection authorities are available here: <a
        href="https://www.edoeb.admin.ch/edoeb/en/home.html">https://www.edoeb.admin.ch/edoeb/en/home.html</a>.</p>
<p><strong>Withdrawing your consent:</strong> If we are relying on your consent to process your personal information,
    which may be express and/or implied consent depending on the applicable law, you have the right to withdraw your
    consent at any time. You can withdraw your consent at any time by contacting us by using the contact details
    provided in the section &quot;HOW CAN YOU CONTACT US ABOUT THIS NOTICE?&quot;
    below or updating your preferences .</p>
<p>However, please note that this will not affect the lawfulness of the processing before its withdrawal nor, when
    applicable law allows, will it affect the processing of your personal information conducted in reliance on lawful
    processing grounds other than consent.</p>
<h3 id="account-information">Account Information</h3>
<p>If you would at any time like to review or change the information in your account or terminate your account, you can:
</p>
<ul>
    <li>Log in to your account settings and update your user account.</li>
    <li>Contact us using the contact information provided.
        Upon your request to terminate your account, we will deactivate or delete your account and information from our
        active databases. However, we may retain some information in our files to prevent fraud, troubleshoot problems,
        assist with any investigations, enforce our legal terms and/or comply with applicable legal requirements.</li>
</ul>
<p><strong>Cookies and similar technologies:</strong> Most Web browsers are set to accept cookies by default. If you
    prefer, you can usually choose to set your browser to remove cookies and to reject cookies. If you choose to remove
    cookies or reject cookies, this could affect certain features or services of our Services. To opt out of
    interest-based advertising by advertisers on our Services visit <a
        href="http://www.aboutads.info/choices/">http://www.aboutads.info/choices/</a>.</p>
<p>If you have questions or comments about your privacy rights, you may email us at <a
        href="mailto:&#115;&#x75;&#x70;&#112;&#x6f;&#114;&#x74;&#64;&#x6d;&#x69;&#115;&#x66;&#105;&#116;&#x63;&#x6f;&#x64;&#x65;&#114;&#x73;&#x2e;&#x63;&#x6f;&#x6d;">&#115;&#x75;&#x70;&#112;&#x6f;&#114;&#x74;&#64;&#x6d;&#x69;&#115;&#x66;&#105;&#116;&#x63;&#x6f;&#x64;&#x65;&#114;&#x73;&#x2e;&#x63;&#x6f;&#x6d;</a>
    .</p>
<h2 id="11-controls-for-do-not-track-features">11. CONTROLS FOR DO-NOT-TRACK FEATURES</h2>
<p>Most web browsers and some mobile operating systems and mobile applications include a Do-Not-Track ( &quot;DNT&quot;
    ) feature or setting you can activate to signal your privacy preference not to have data about your online browsing
    activities monitored and collected. At this stage no uniform technology standard for recognizing and implementing
    DNT signals has been finalized . As such, we do not currently respond to DNT browser signals or any other mechanism
    that automatically communicates your choice not to be tracked online. If a standard for online tracking is adopted
    that we must follow in the future, we will inform you about that practice in a revised version of this privacy
    notice.</p>
<h2 id="12-do-california-residents-have-specific-privacy-rights">12. DO CALIFORNIA RESIDENTS HAVE SPECIFIC PRIVACY
    RIGHTS?</h2>
<p><strong><em>In Short:</em></strong> <em>Yes, if you are a resident of California, you are granted specific rights
        regarding access to your personal information.</em></p>
<p>California Civil Code Section 1798.83, also known as the &quot;Shine The Light&quot; law, permits our users who are
    California residents to request and obtain from us, once a year and free of charge, information about categories of
    personal information (if any) we disclosed to third parties for direct marketing purposes and the names and
    addresses of all third parties with which we shared personal information in the immediately preceding calendar year.
    If you are a California resident and would like to make such a request, please submit your request in writing to us
    using the contact information provided below.</p>
<p>If you are under 18 years of age, reside in California, and have a registered account with Services, you have the
    right to request removal of unwanted data that you publicly post on the Services. To request removal of such data,
    please contact us using the contact information provided below and include the email address associated with your
    account and a statement that you reside in California. We will make sure the data is not publicly displayed on the
    Services, but please be aware that the data may not be completely or comprehensively removed from all our systems
    (e.g. , backups, etc.).</p>
<h3 id="ccpa-privacy-notice">CCPA Privacy Notice</h3>
<p>The California Code of Regulations defines a &quot;resident&quot; as:</p>
<p>(1) every individual who is in the State of California for other than a temporary or transitory purpose and
    (2) every individual who is domiciled in the State of California who is outside the State of California for a
    temporary or transitory purpose</p>
<p>All other individuals are defined as &quot;non-residents.&quot;</p>
<p>If this definition of &quot;resident&quot; applies to you, we must adhere to certain rights and obligations regarding
    your personal information.</p>
<h3 id="what-categories-of-personal-information-do-we-collect">What categories of personal information do we collect?
</h3>
<p>We have collected the following categories of personal information in the past twelve (12) months:</p>
<p>A. Identifiers
    Contact details, such as real name, alias, postal address, telephone or mobile contact number, unique personal
    identifier, online identifier, Internet Protocol address, email address, and account name</p>
<p>NO</p>
<p>B. Personal information categories listed in the California Customer Records statute
    Name, contact information, education, employment, employment history, and financial information</p>
<p>NO</p>
<p>C. Protected classification characteristics under California or federal law
    Gender and date of birth</p>
<p>NO</p>
<p>D. Commercial information
    Transaction information, purchase history, financial details, and payment information</p>
<p>NO</p>
<p>E. Biometric information
    Fingerprints and voiceprints</p>
<p>NO</p>
<p>F. Internet or other similar network activity
    Browsing history, search history, online behavior , interest data, and interactions with our and other websites,
    applications, systems, and advertisements</p>
<p>NO</p>
<p>G. Geolocation data
    Device location</p>
<p>NO</p>
<p>H. Audio, electronic, visual, thermal, olfactory, or similar information
    Images and audio, video or call recordings created in connection with our business activities</p>
<p>NO</p>
<p>I. Professional or employment-related information
    Business contact details in order to provide you our Services at a business level or job title, work history, and
    professional qualifications if you apply for a job with us</p>
<p>NO</p>
<p>J. Education Information
    Student records and directory information</p>
<p>NO</p>
<p>K. Inferences drawn from other personal information
    Inferences drawn from any of the collected personal information listed above to create a profile or summary about,
    for example, an individual's preferences and characteristics</p>
<p>NO</p>
<p>We may also collect other personal information outside of these categories through instances where you interact with
    us in person, online, or by phone or mail in the context of:</p>
<ul>
    <li>Receiving help through our customer support channels;</li>
    <li>Participation in customer surveys or contests; and</li>
    <li>Facilitation in the delivery of our Services and to respond to your inquiries.</li>
</ul>
<p><strong>How do we use and share your personal information?</strong></p>
<p>More information about our data collection and sharing practices can be found in this privacy notice .</p>
<p>You may contact us by email at <a
        href="mailto:&#115;&#117;&#112;&#x70;&#111;&#x72;&#116;&#x40;&#103;&#108;&#97;&#114;&#x65;&#104;&#x75;&#x62;&#46;&#110;&#101;&#x74;">&#115;&#117;&#112;&#x70;&#111;&#x72;&#116;&#x40;&#103;&#108;&#97;&#114;&#x65;&#104;&#x75;&#x62;&#46;&#110;&#101;&#x74;</a>
    , or by referring to the contact details at the bottom of this document.</p>
<p>If you are using an authorized agent to exercise your right to opt out we may deny a request if the authorized agent
    does not submit proof that they have been validly authorized to act on your behalf.</p>
<p><strong>Will your information be shared with anyone else?</strong></p>
<p>We may disclose your personal information with our service providers pursuant to a written contract between us and
    each service provider. Each service provider is a for-profit entity that processes the information on our behalf.
</p>
<p>We may use your personal information for our own business purposes, such as for undertaking internal research for
    technological development and demonstration. This is not considered to be &quot;selling&quot; of your personal
    information.</p>
<p>Misfitcoders ÖU has not disclosed or sold any personal information to third parties for a business or commercial
    purpose in the preceding twelve (12) months. Misfitcoders ÖU will not sell personal information in the future
    belonging to website visitors, users, and other consumers.</p>
<h3 id="your-rights-with-respect-to-your-personal-data">Your rights with respect to your personal data</h3>
<p>Right to request deletion of the data — Request to delete</p>
<p>You can ask for the deletion of your personal information. If you ask us to delete your personal information, we will
    respect your request and delete your personal information, subject to certain exceptions provided by law, such as
    (but not limited to) the exercise by another consumer of his or her right to free speech, our compliance
    requirements resulting from a legal obligation, or any processing that may be required to protect against illegal
    activities.</p>
<p>Right to be informed — Request to know</p>
<p>Depending on the circumstances, you have a right to know:</p>
<ul>
    <li>whether we collect and use your personal information;</li>
    <li>the categories of personal information that we collect;</li>
    <li>the purposes for which the collected personal information is used;</li>
    <li>whether we sell your personal information to third parties;</li>
    <li>the categories of personal information that we sold or disclosed for a business purpose;</li>
    <li>the categories of third parties to whom the personal information was sold or disclosed for a business purpose;
        and</li>
    <li>the business or commercial purpose for collecting or selling personal information.</li>
</ul>
<p>In accordance with applicable law, we are not obligated to provide or delete consumer information that is
    de-identified in response to a consumer request or to re-identify individual data to verify a consumer request.</p>
<p>Right to Non-Discrimination for the Exercise of a Consumer's Privacy Rights</p>
<p>We will not discriminate against you if you exercise your privacy rights.</p>
<p>Verification process</p>
<p>Upon receiving your request, we will need to verify your identity to determine you are the same person about whom we
    have the information in our system. These verification efforts require us to ask you to provide information so that
    we can match it with information you have previously provided us. For instance, depending on the type of request you
    submit, we may ask you to provide certain information so that we can match the information you provide with the
    information we already have on file, or we may contact you through a communication method (e.g. , phone or email)
    that you have previously provided to us. We may also use other verification methods as the circumstances dictate.
</p>
<p>We will only use personal information provided in your request to verify your identity or authority to make the
    request. To the extent possible, we will avoid requesting additional information from you for the purposes of
    verification. However, if we cannot verify your identity from the information already maintained by us, we may
    request that you provide additional information for the purposes of verifying your identity and for security or
    fraud-prevention purposes. We will delete such additionally provided information as soon as we finish verifying you.
</p>
<p>Other privacy rights</p>
<ul>
    <li>You may object to the processing of your personal information.</li>
    <li>You may request correction of your personal data if it is incorrect or no longer relevant, or ask to restrict
        the processing of the information.</li>
    <li>You can designate an authorized agent to make a request under the CCPA on your behalf. We may deny a request
        from an authorized agent that does not submit proof that they have been validly authorized to act on your behalf
        in accordance with the CCPA.</li>
    <li>You may request to opt out from future selling of your personal information to third parties. Upon receiving an
        opt-out request, we will act upon the request as soon as feasibly possible, but no later than fifteen (15) days
        from the date of the request submission.
        To exercise these rights, you can contact us by email at <a
            href="mailto:&#x73;&#117;&#x70;&#112;&#x6f;&#114;&#x74;&#64;&#x67;&#108;&#x61;&#x72;&#x65;&#x68;&#x75;&#98;&#x2e;&#x6e;&#101;&#x74;">&#x73;&#117;&#x70;&#112;&#x6f;&#114;&#x74;&#64;&#x67;&#108;&#x61;&#x72;&#x65;&#x68;&#x75;&#98;&#x2e;&#x6e;&#101;&#x74;</a>
        , or by referring to the contact details at the bottom of this document. If you have a complaint about how we
        handle your data, we would like to hear from you.</li>
</ul>
<h2 id="13-do-we-make-updates-to-this-notice">13. DO WE MAKE UPDATES TO THIS NOTICE?</h2>
<p><em><strong>In Short:</strong> Yes, we will update this notice as necessary to stay compliant with relevant
        laws.</em></p>
<p>We may update this privacy notice from time to time. The updated version will be indicated by an updated
    &quot;Revised&quot; date and the updated version will be effective as soon as it is accessible. If we make material
    changes to this privacy notice, we may notify you either by prominently posting a notice of such changes or by
    directly sending you a notification. We encourage you to review this privacy notice frequently to be informed of how
    we are protecting your information.</p>
<h2 id="14-how-can-you-contact-us-about-this-notice">14. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?</h2>
<p>If you have questions or comments about this notice, you may email us at <a
        href="mailto:&#115;&#117;&#112;&#x70;&#111;&#x72;&#x74;&#x40;&#109;&#x69;&#x73;&#102;&#105;&#x74;&#x63;&#x6f;&#100;&#101;&#114;&#115;&#x2e;&#x63;&#x6f;&#109;">&#115;&#117;&#112;&#x70;&#111;&#x72;&#x74;&#x40;&#109;&#x69;&#x73;&#102;&#105;&#x74;&#x63;&#x6f;&#100;&#101;&#114;&#115;&#x2e;&#x63;&#x6f;&#109;</a>
    or by post to:</p>
<p>Misfitcoders ÖU
    Calle Eduardo Rivas 14 3E
    Madrid , Madrid 28019
    Spain</p>
<p>If you are a resident in the European Economic Area, the &quot;data controller&quot; of your personal information is
    Misfitcoders ÖU . Misfitcoders ÖU has appointed Misfitcoders ÖU to be its representative in the EEA. You can contact
    them directly regarding the processing of your information by Misfitcoders ÖU , by email at <a
        href="mailto:&#115;&#x75;&#112;&#112;&#x6f;&#114;&#116;&#64;&#x6d;&#x69;&#115;&#x66;&#x69;&#116;&#x63;&#x6f;&#x64;&#101;&#114;&#115;&#46;&#x63;&#x6f;&#109;">&#115;&#x75;&#112;&#112;&#x6f;&#114;&#116;&#64;&#x6d;&#x69;&#115;&#x66;&#x69;&#116;&#x63;&#x6f;&#x64;&#101;&#114;&#115;&#46;&#x63;&#x6f;&#109;</a>
    , by visiting <a href="http://www.misfitcoders.com">http://www.misfitcoders.com</a> , by phone at +34 6099771307 ,
    or by post to:</p>
<p>Calle Eduardo Rivas 14 3E
    Madrid , Madrid 28019
    Spain</p>
<h2 id="15-how-can-you-review-update-or-delete-the-data-we-collect-from-you">15. HOW CAN YOU REVIEW, UPDATE, OR DELETE
    THE DATA WE COLLECT FROM YOU?</h2>
<p>Based on the applicable laws of your country, you may have the right to request access to the personal information we
    collect from you, change that information, or delete it. To request to review, update, or delete your personal
    information, please visit: <a href="https://ilurama.com/profile">https://ilurama.com/profile</a> .</p>

    
    </div>  
    </Container>
      <Divider space='5' />
      <Footer content={content['footer']} />
    </Layout>
  )
}

export const query = graphql`
  query privacyBlockContent {
    allBlockContent(
      filter: { page: { in: ["site/legal", "shared"] } }
    ) {
      nodes {
        ...BlockContent
      }
    }
  }
`

export default Privacy
