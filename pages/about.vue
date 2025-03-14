<template>
  <div class="max-w-4xl mx-auto px-6 py-12">
    <h1 class="text-3xl font-bold text-gray-900 mb-6">About Focused</h1>

    <div class="prose prose-indigo max-w-none">
      <h2>Our Story</h2>
      
      <h3>From Struggle to Solution: The Birth of Focused</h3>
      <p>
        I was 27 when I finally got my ADHD diagnosis. By that point, I'd already cycled through three different careers, 
        left countless projects unfinished, and mastered the art of the last-minute all-nighter.
      </p>
      
      <p>
        Like many with ADHD, I was both blessed with bursts of hyperfocus that allowed me to produce incredible work and 
        cursed with an attention span that could be derailed by the smallest notification.
      </p>

      <h3>The Breaking Point</h3>
      <p>
        It was during my time as a software developer that I hit a wall. The demands of coding required sustained focus – 
        something I struggled with despite loving the actual work. I tried everything: time blockers, website blockers, 
        the Pomodoro technique. Nothing stuck.
      </p>
      
      <p>
        What did help was when my colleague would occasionally sit nearby, not to actively monitor me, but to create an 
        environment where I felt accountable. When he noticed I was getting distracted, he'd gently ask, "What were you 
        working on again?" This simple prompt was remarkably effective and helped me redirect my attention.
      </p>
      
      <p>
        But I couldn't ask someone to sit with me all day, every day.
      </p>
      
      <p>
        What if I could build something that would do this automatically?
      </p>

      <h3>Building Focused</h3>
      <p>
        With my background in AI and software development, I began experimenting with a system that could detect 
        when I was distracted and provide gentle reminders based on what I was supposed to be working on.
      </p>
      
      <p>
        The first prototype was crude – just a simple screen monitoring tool that would beep when I opened certain websites. 
        But even this basic version showed promise.
      </p>
      
      <p>
        Over the next year, I refined the system, adding:
      </p>
      <ul>
        <li>More sophisticated distraction detection</li>
        <li>Customizable focus sessions</li>
        <li>Detailed analytics to identify patterns</li>
        <li>And, most importantly, context-aware coaching</li>
      </ul>
      
      <p>
        I shared early versions with friends in the ADHD community, and their feedback was incredibly encouraging. 
        Many reported the same experience I had – finally, a tool that seemed to understand how their brains worked.
      </p>

      <h3>Beyond a Tool: A Focus System</h3>
      <p>
        Focused isn't just another productivity app. It's a comprehensive system designed specifically for those 
        who struggle with sustained attention, whether diagnosed with ADHD or not.
      </p>
      
      <p>
        What makes us different is that we don't just measure time or block distractions – we actively help you build 
        better focus habits through real-time interventions that respect your unique work style and challenges.
      </p>
      
      <p>
        Our mission is to help people reclaim their productivity without shame or judgment. We believe that with the 
        right support, the creative, innovative minds that often come with attention differences can truly flourish.
      </p>

      <h3>Looking Forward</h3>
      <p>
        Today, Focused is used by thousands of people worldwide, from students to CEOs, all seeking to work better 
        with their natural attention patterns rather than fighting against them.
      </p>
      
      <p>
        We're particularly proud of our upcoming voice coaching feature, which will bring the experience even closer 
        to having a supportive, understanding presence helping you stay on track.
      </p>
      
      <p>
        The journey from my personal struggle to building Focused has been transformative. What began as a solution 
        to my own ADHD challenges has evolved into a mission to help others unleash their potential, one focused session at a time.
      </p>
      
      <p>
        I hope it helps you as much as it's helped me.
      </p>

      <hr class="my-8" />

      <h2>Our Team</h2>
      <p>
        Focused is supported by a dedicated team of developers, designers, and productivity experts, many of whom have 
        first-hand experience with ADHD or other neurodivergent conditions. Together, we're committed to building tools 
        that help people work better with their brains, not against them.
      </p>
      
      <p>
        We're headquartered in Seattle, with team members working remotely across North America and Europe.
      </p>

      <hr class="my-8" />

      <h2>Our Values</h2>
      
      <h3>1. Neurodiversity as Strength</h3>
      <p>
        We believe that different cognitive styles offer unique perspectives and advantages. Our tools are designed 
        to harness these strengths while providing support for associated challenges.
      </p>
      
      <h3>2. Privacy by Design</h3>
      <p>
        We believe productivity tools should empower, not surveil. All our features are built with stringent 
        privacy protections and user control as foundational principles.
      </p>
      
      <h3>3. Evidence-Based Approaches</h3>
      <p>
        Our features are grounded in cognitive science and real-world testing, not trendy productivity hacks. 
        We measure success by actual improvements in focus and work quality.
      </p>
      
      <h3>4. Continuous Improvement</h3>
      <p>
        Just as we help our users build better focus habits over time, we're committed to continuously improving 
        our platform based on research and user feedback.
      </p>
      
      <h3>5. Accessibility and Inclusion</h3>
      <p>
        We're dedicated to making effective productivity tools available to everyone who needs them, regardless 
        of background or resources.
      </p>
      
      <div class="mt-12">
        <a :href="getSignupUrl()" class="btn-primary inline-block">Start Free Trial</a>
      </div>
    </div>
  </div>
</template>

<script setup>
// Get the signup URL from environment
const { getSignupUrl } = useAppUrl();

// Update the page title and meta description
useHead({
  title: 'About Focused - AI-Powered Productivity for ADHD/ADD Minds',
  meta: [
    { name: 'description', content: 'Learn about Focused - our mission, story, and approach to building AI productivity tools for ADHD/ADD minds.' }
  ]
});
</script>