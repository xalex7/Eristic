//
//  FallacyDetailesModel.swift
//  Eristic
//
//  Created by Fady A Eid on 11/21/23.
//

import Foundation

// Class representing a fallacy with various attributes
class Fallacy: Identifiable {
    var id: Int
    var title: String
    var definition: String
    var examples: String
    var whyFallacy: String
    var tipsToIdentify: String
    var howToAvoid: String
    var consequences: String
    var counteringTips: String
    
    // Initialize the fallacy with provided information
    init(id: Int, title: String, definition: String, examples: String, whyFallacy: String, tipsToIdentify: String, howToAvoid: String, consequences: String, counteringTips: String) {
        self.id = id
        self.title = title
        self.definition = definition
        self.examples = examples
        self.whyFallacy = whyFallacy
        self.tipsToIdentify = tipsToIdentify
        self.howToAvoid = howToAvoid
        self.consequences = consequences
        self.counteringTips = counteringTips
    }
}
 
// Struct containing a list of fallacies
struct FallaciesList {
    // A static list of fallacies, always in memory
    static let fallacies: [Fallacy] = [
        Fallacy(
            
            // List of fallacies with detailed information
            id: 1, title: "Straw Man",
            definition: "Misrepresenting or oversimplifying the opponent's argument to make it easier to attack, which nstead of addressing the actual points raised, it creates a distorted version, a 'straw man', and attack that instead.",
            examples: "👱‍♂️'We should invest more in education.'\n👨‍🦳'So, you want to throw money at a broken system?'\n\n👩‍🦱'Climate change is a serious global issue that requires immediate attention.'\n👩‍🦰'Oh, you think we should just shut down all industries and go back to living in caves?'\n\n👨‍🦱'A comprehensive immigration reform is necessary to address economic and social challenges.'\n👱‍♀️'So, you want open borders and let everyone in without any control?'",
            whyFallacy: "It involves misrepresenting an opponent's argument, distorting its original form to create a simplified or exaggerated version that is easier to attack. By engaging with this distorted representation instead of the actual points raised, the fallacy avoids addressing the real issues at hand. ",
            tipsToIdentify: "🔹 Look for a distorted or exaggerated version of the original argument.\n\n🔹 Often involves using extreme or overly emotional language to characterize someone's argument.\n\n🔹 often relies on emotional appeals rather than sound logic.\n\n🔹 Ensure that your words are accurately quoted. Misquoting can contribute to creating a distorted version of your argument.",
            howToAvoid: "🔹 Clarify and understand the opponent's argument accurately before responding.\n\n🔹 Be clear and precise in your own communication to minimize the chances of misinterpretation or oversimplification.",
            consequences: "🔹 Leads to misunderstandings and a failure to address the actual points raised.\n\n🔹 can be seen as a form of intellectual dishonesty. Instead of engaging with the substance of an argument, it involves manipulating or misrepresenting the opponent's position to gain an advantage.",
            counteringTips: "Correct the misrepresentation and address the actual argument."
        ),
        Fallacy(
            id: 2, title: "Ad Hominem",
            definition: "Attacking the character, motives, or beliefs of their opponent instead of presenting evidence or counterarguments to refute their position.",
            examples: "👩‍🦰 'I believe that climate change is a serious issue and we need to take action to reduce our carbon emissions.'\n👨 'Well, you failed science in high school, so your opinion doesn't matter.'\n\n🧔‍♂️ 'I think the new software update will improve our productivity.\n👵 'But you always struggle with technology, so your opinion is irrelevant.'",
            whyFallacy: "it involves attacking the person presenting an argument rather than addressing the actual content of the argument. Discrediting an individual's character or personal traits does not logically invalidate their point or the evidence they provide.",
            tipsToIdentify: "🔹 Look for statements undermining the person's character, intelligence, or personal life.\n\n🔹 When the speaker makes accusations or negative claims about the opponent without providing any evidence. ",
            howToAvoid: "🔹 Concentrate on discussing the merits of the ideas presented rather than diverting attention to the person presenting them.\n\n🔹 Separate People from Arguments, and recognize that individuals can have valid points even if they have personal flaws.",
            consequences: "\n\n🔹 Prevent individuals from truly understanding different perspectives or learning from diverse experiences, and closes the door to valuable insights that could contribute to personal and collective growth.\n\n🔹 It fosters an atmosphere where individuals are discouraged from expressing their opinions for fear of personal attacks, stifling free and open discourse.",
            counteringTips: "🔹 Redirect the conversation to the actual argument.\n\n🔹 If the person making the argument provides evidence, challenge that evidence. Show why it is not reliable or does not support the argument.\n\n🔹 Clearly articulate your original position to ensure there is no ambiguity or room for misinterpretation. Emphasize the key points of your argument."
        ),
        Fallacy(
            id: 3,
            title: "False Dilemma",
            definition: "Presenting a situation as if there are only two mutually exclusive options, and overlooking alternatives and nuances that may exist.",
            examples: "🧔‍♀️ 'You're either with us or against us in this project.'\n\n👱‍♀️ 'You can either be a liberal or a conservative; there's no in-between.'\n\n👩‍🦲 'You're either a strict vegan or you hate animals!'" ,
            whyFallacy: "Oversimplifies a complex issue by limiting the options to an either/or scenario, neglecting the potential for a middle ground or other alternatives. This type of reasoning can be deceptive and doesn't accurately represent the full range of choices available in a given situation.",
            tipsToIdentify: "🔹 Check if only two extreme options are presented, excluding middle grounds or alternatives.\n\n🔹 Consider if the two presented options are extreme and do not encompass the full range of possibilities.",
            howToAvoid: "🔹 Explore and consider a broader range of possibilities before drawing conclusions.\n\n🔹 Be open to exploring middle grounds and nuances.\n\n🔹 Avoid making statements that oversimplify complex issues.",
            consequences: "Narrows perspectives, leading to decisions based on a limited and inaccurate view.\n\n🔹 It can lead to polarized thinking and conflict.",
            counteringTips: "🔹 Highlight additional options and encourage a more nuanced discussion.\n\n🔹 Ask whether the choices presented are the only valid ones or if there are other valid perspectives."
        ),
        Fallacy(
            id: 4,
            title: "Appeal to Ignorance",
            definition: "Asserting that a claim is true or false solely based on the lack of evidence or proof to support or refute it. This fallacy mistakenly equates absence of evidence with evidence of absence, leading to unsubstantiated beliefs and conclusions.",
            examples: "🧔 'No one has proven that ghosts don't exist, so they must be real.\n\n There is no scientific evidence proving that vitamins cure the common cold, so they don't work'.\n\n👩‍🦰 'You cannot prove that I didn't steal your wallet, so you can't accuse me.'",
            whyFallacy: "It places the burden of proof entirely on one side of the argument, disregarding the possibility of gathering more information or conducting further research. Merely because a claim has not been disproven does not automatically make it true or valid. By relying on this fallacy, individuals fail to consider the vastness of the unknown, the complexity of evidence gathering, or the existence of alternative explanations.",
            tipsToIdentify: "🔹 Lack of evidence, since the argument relies on the absence of evidence to support a claim, asserting that because something has not been proven false, it must be true, or vice versa.\n\n🔹 Questions like 'Why haven't you proven it wrong?' or 'How do you know it doesn't exist?' should raise red flags as they often indicate this fallacy in play.\n\n🔹 Placing the burden on the other party to disprove a claim rather than providing evidence in favor of the claim.",
            howToAvoid: "🔹 Shift the focus to presenting affirmative evidence. Instead of relying on the absence of proof for a claim, strive to provide objective data, testimony, or logical reasoning that supports your argument.\n\n🔹 Emphasize the importance of gathering and evaluating reliable evidence to build a sound and convincing argument.",
            consequences: "It fosters the spread of misinformation and unfounded beliefs. Embracing this fallacy can lead to making decisions based on inadequate evidence, resulting in poor judgment and potentially harmful consequences. By encouraging critical thinking and the pursuit of empirical evidence, we can counteract the influence of this fallacy and build a more informed and rational society.",
            counteringTips: "🔹 Ask for affirmative evidence to support the claim, and encourage the proponent to provide factual information or reliable data that substantiates their argument.\n\n🔹 Emphasize that many issues are complex and may not have straightforward answers."
        ),
        Fallacy(
            id: 5,
            title: "Slippery Slope",
            definition: "Asserting that a relatively small first step will lead to a chain of events culminating in a significant, often negative, outcome.",
            examples: "'🧑‍🦳 If we allow flexible work hours, soon nobody will come to the office, and the company will fail.'\n\n'👨‍🦱 If we start teaching critical race theory in schools, students will start hating each other based on their race.'",
            whyFallacy: "It is based on emotional reasoning due to fear of unintended consequences rather than empirical evidence. Slippery Slope arguments are generally subjective and dependent on presumptions, thereby oversimplifying complex decision-making processes. While some genuine, incremental effects may occur, they often don't reach the exaggerated, alarmist end-result predicted.",
            tipsToIdentify: "🔹 Look for a chain of events presented without clear evidence supporting each step.\n\n🔹 Observe if the argument relies heavily on emotions, such as fear or alarm, rather than logical reasoning \n\n🔹 Look for an absolute statement predicting that one event will always lead to another, without exception.",
            howToAvoid: "Evaluate each step in a sequence independently and assess its likelihood and impact.\n\n🔹 Analyze the specific conditions and factors that might influence the chain of events.\n\n🔹 Consider the potential benefits and drawbacks of taking the initial action, rather than focusing solely on potential negative consequences.",
            consequences: "Prevent people from making informed decisions and lead to unnecessary anxiety and resistance to change. It can hinder progress and innovation by focusing more on fear-based outcomes than on facts and evidence.",
            counteringTips: "Encourage critical thinking and ask for evidence supporting each step in the proposed chain of events. Encourage analyzing the odds and consequences of an action independently of predicted outcomes."
        ),
        Fallacy(
            id: 6,
            title: "Circular Reasoning",
            definition: "conclusion used as a premise to support that same conclusion. This logical fallacy can weaken an argument because it doesn't provide any new evidence or reasoning to support the conclusion. It can also be called 'vicious reasoning' or 'begging the question.'",
            examples: "👩‍🦱 'This book is the best because it's the most superior literature.'\n\n👵 'God exists because the Bible says so, and the Bible is the word of God.'\n\n👨‍🦳 'I'm right! because I said so.'",
            whyFallacy: "Using the conclusion as a premise doesn't provide any new information or reasoning to support the claim. It just restates the original point without offering any evidence. This type of argument can be frustrating because it doesn't offer any evidence to convince someone who doesn't already agree with the conclusion.",
            tipsToIdentify: "🔹 Check if the argument relies on itself to prove its own point without external support.\n\n🔹 Look for repeated statements or phrases that are similar to the conclusion.\n\n🔹 Be skeptical of arguments that seem too simple or too easy to prove. Sometimes, circular reasoning can create the illusion of a strong argument when there isn't any substance to it.",
            howToAvoid: "🔹 Ensure that the premises offer independent support for the conclusion.\n\n🔹 Use evidence, facts, and logic to support your arguments.\n\n🔹 Be open to questioning your own assumptions and biases. Sometimes, we can unconsciously use circular reasoning when we're trying to defend a viewpoint that we already hold.",
            consequences: "🔹 Fails to convince skeptics and lacks the substance needed for a strong argument.\n\n🔹 Prevents a person from understanding the real reasons behind a belief or claim. \n\n🔹 prevent an argument from advancing because it doesn't provide any new information or insight.",
            counteringTips: "🔹 Request additional evidence or reasoning that doesn't loop back to the original claim.\n\n🔹ask them to explain how the premises lead to the conclusion without relying on the conclusion itself. This can help to expose the circularity in the argument and to encourage the person to provide stronger evidence."
        ),
        Fallacy(
            id: 7,
            title: "Hasty Generalization",
            definition: "Drawing a broad conclusion or makes a general statement based on a limited, biased, or unrepresentative sample. It results in oversimplification and fails to consider the complexity and diversity of the subject at hand.",
            examples: "👩 'I met two rude Californians, so everyone from California must be rude.'\n\n👱‍♂️ 'People who don’t like football are boring.'\n\n👩‍🦰 'If you fail once, you’ll always fail.'",
            whyFallacy: "It is a cognitive bias that arises from our tendency to simplify complex information and make quick judgments without sufficient evidence. This fallacy can lead to misconceptions, stereotypes, and discrimination, affecting our ability to understand and navigate the diverse world around us.",
            tipsToIdentify: "🔹 Look for conclusions drawn from limited or biased examples.\n\n🔹 Be aware of conclusions drawn from anecdotal experiences or isolated incidents.",
            howToAvoid: "🔹 Challenge yourself to seek out a diverse and representative sample when making observations or drawing conclusions.\n\n🔹 Gather comprehensive data and analyze it critically to avoid making premature judgments.\n\n🔹 Practice critical thinking and consider alternative perspectives before formulating general conclusions.",
            consequences: "Results in unfair stereotypes and prejudice against groups or individuals based on limited evidence. It hinders empathy and understanding and can create divisions and conflicts in society.",
            counteringTips: "🔹 Present counterexamples that challenge the generalization and highlight the diversity within the subject.\n\n🔹 Emphasize the importance of evidence-based reasoning and systematic analysis when making conclusions."
        ),
        Fallacy(
            id: 8,
            title: "Appeal to Authority",
            definition: "Arguing by appealing to the authority, expertise, or credentials of a stated source rather than presenting solid evidence, facts, or logic. The arguer believes that their viewpoint is correct because an expert, authority figure, or influential person supports it.",
            examples: "👱‍♂️ 'The world-renowned scientist believes that climate change is a hoax.'\n\n 👨‍🦱 'Well, you know, Oprah said it was a fantastic book.'\n\n👱‍♀️ 'According to the CEO of this company, this product has revolutionized the industry.'",
            whyFallacy: "The validity of a notion relies only on the credibility and expertise of the authority, not on its own merits. Even a respected authority might occasionally be incorrect or biased.",
            tipsToIdentify: "Check to see whether the argument places a heavy emphasis on the authority's reputation rather than providing credible proof or logic.",
            howToAvoid: "🔹 Concentrate on assessing the merit of the evidence and arguments presented. It is acceptable to consider an authority's viewpoint, but only if it is supported by evidence and logic.\n\n🔹 Seek out alternative viewpoints, conduct further research, and use critical thought to come to well-considered conclusions.",
            consequences: "it can result in gullibility, groupthink, and a lack of critical thinking skills. False information can lead to adverse effects, such as supporting unproven medical treatments or making inadequate financial decisions.",
            counteringTips: "🔹 Seek additional evidence and consider alternative viewpoints regardless of the authority involved.\n\n🔹 Investigate the authority's expertise in the relevant field and consider any potential biases. Evaluate the reasoning objectively and, if possible, form independent conclusions."
        ),
        Fallacy(
            id: 9,
            title: "Red Herring",
            definition: "Commonly used in arguments or discussions to divert attention away from the central topic or issue at hand. Instead, it introduces an irrelevant or tangential subject. This technique aims to mislead, confound, or derail the conversation's trajectory.",
            examples: "👩‍🦱 'We should prioritize addressing climate change and reducing our carbon footprint.\n\n👨 'What about the pressing issue of poverty and income inequality? Shouldn't that be our main focus?'",
            whyFallacy: "It shifts the focus away from the main argument or issue. By introducing unrelated or tangential points, the original topic can be disregarded or dismissed without proper consideration. This can lead to a lack of resolution or prevent meaningful discussions from taking place.",
            tipsToIdentify: "🔹 Look for information that doesn't directly address the main point.\n\n🔹 Watch for abrupt changes in the discussion, diverting attention to more superficial or emotionally charged subjects.",
            howToAvoid: "Stay focused on the main topic and don't let irrelevant details distract from the discussion.",
            consequences: "Can lead to confusion and frustration among participants.\n\n🔹 It may lead to a lack of progress in addressing the core argument or issue.\n\n🔹 It can create an environment of distrust, as people may feel their concerns are intentionally being sidestepped.",
            counteringTips: "🔹 Bring the discussion back to the main point and ask for relevant information.\n\n🔹 emphasize the importance of staying focused on the central topic to ensure a productive discussion."
        ),
        Fallacy(
            id: 10,
            title: "Equivocation",
            definition: "Using a word or phrase in more than one sense, allowing them to make an argument that seems reasonable, but it's not. Often spelled out in this format: If X is Y, and Y is Z, then Z must be X.",
            examples: "🧑‍🦳 'Soil is natural. Natural things are good for you. So it’s okay to ingest soil.'\n\n👨‍🦳 'All men are created equal. Women aren’t men, so all women aren’t created equal.' 🧔‍♂️ 'Cats make great pets. Tigers are big cats. That means tigers make great pets.'",
            whyFallacy: "compromises the reliability and validity of the argument, as it relies on intentionally ambiguous language rather than a clear and consistent use of terms, making it logically unsound.\n\n🔹 ",
            tipsToIdentify: "🔹 Identifying equivocation involves recognizing shifts in meaning of a term within an argument.\n\n🔹 Watch for instances where a word is used with different meanings without clarification.\n\n🔹 Be alert to vague or ambiguous language, as equivocation often relies on exploiting such linguistic nuances.",
            howToAvoid: "🔹 Strive for clarity and precision in language, using terms consistently with a single, well-defined meaning.\n\n🔹 Be vigilant about the potential for multiple interpretations of a word and address any shifts in meaning promptly during your discourse.\n\n🔹 Encourage clear communication in discussions by seeking clarification when terms appear to be used ambiguously.",
            consequences: "using a term with multiple meanings can give the illusion of a coherent argument when, in reality, there is ambiguity. ",
            counteringTips: "🔹 Challenge equivocation by requesting clear and specific definitions of key terms within the argument.\n\n🔹 Present counterexamples that demonstrate the fallacy, showing how the argument's reliance on equivocation weakens its logical foundation."
        ),
        Fallacy(
            id: 11,
            title: "Appeal to Emotion",
            definition: "Using emotional triggers instead of logical reasoning to persuade or make a point.",
            examples: "👱‍♀️ 'Support this candidate because they deeply care about your family's well-being and will protect your children's future.'\n\n🧔 'Take this supplement; it will cleanse your body of toxins and make you feel vibrant and alive.'\n\n👩‍🦱 'Donate now to save innocent lives and bring hope to those suffering from hunger and poverty'",
            whyFallacy: "Manipulates emotions rather than presenting rational arguments.",
            tipsToIdentify: "🔹 Look for language or content that evokes strong emotional reactions.\n\n🔹 Pay attention to exaggerated or hyperbolic language that aims to intensify emotions.\n\n🔹 Visual elements or descriptions that provoke strong emotional reactions without contributing substantial information to the argument",
            howToAvoid: "🔹 Appeal to the audience's intellect and reason rather than their emotions.\n\n🔹 Encourage critical thinking and a rational evaluation of the evidence presented.\n\n🔹 Use neutral and objective language to convey your message, and avoid overly dramatic or exaggerated language that aims to evoke emotional responses.",
            consequences: "🔹 When decisions are driven primarily by emotions rather than logic and evidence, the outcomes may not align with the best interests of those involved.\n\n🔹 Those who use emotional appeals to manipulate or exploit others may achieve short-term gains, but this can lead to a breakdown of trust and credibility over time.\n\n🔹 Emotional appeals may escalate tensions rather than fostering a rational and collaborative approach to problem-solving.",
            counteringTips: "🔹 Ask for evidence and reasoned explanations that go beyond emotional appeal.\n\n🔹 Assess the credibility and motives of the source presenting emotional appeals."
        ),
        Fallacy(
            id: 12,
            title: "Tu Quoque",
            definition: "Highlighting the perceived hypocrisy of the person presenting the argument. It erroneously suggests that if the accuser is guilty of the same actions, their criticism is invalid.",
            examples: "👩‍🦰 'Being on time for meetings is crucial for team efficiency.'\n👩‍🦱 'You were late to the morning briefing last week!'\n\n👵 'You should cut down on sugary drinks; they're unhealthy.'\n👨‍🦳 'But I've seen you drinking soda before!'",
            whyFallacy: "🔹 Deflects attention away from the original argument and focuses on the personal inconsistencies of the opponent.\n\n🔹 Just because the person presenting an argument may have engaged in similar behavior doesn't automatically invalidate the argument itself.\n\n🔹 Assumes that if someone is guilty of a particular action, their argument is automatically incorrect or hypocritical. This guilt-by-association approach is logically unsound.",
            tipsToIdentify: "🔹 Listen for phrases like 'you too' or 'look who's talking'.\n\n🔹 Attempting to avoid accountability for their actions or opinions by redirecting attention to the behavior of the accuser. ",
            howToAvoid: "🔹 Focus on addressing the substance of the argument, not the person making it.\n\n🔹 If the accuser makes a valid point, acknowledge it. Avoid dismissing their argument solely based on perceived hypocrisy.\n\n🔹 Recognize that personal conduct doesn't automatically invalidate the argument, and ealuate the argument on its own merits.",
            consequences: "🔹 It weakens the overall strength of one's argument, as tt fails to address the core issues and relies on diversionary tactics.\n\n🔹 May diminish the credibility of the individual employing it, since others may perceive it as a strategy to avoid addressing valid concerns or criticisms.\n\n🔹 Accusing someone of hypocrisy may escalate tension in the conversation, leading to a more hostile environment.",
            counteringTips: "🔹 Begin by acknowledging any valid points the other person has made, demonstrating a willingness to find common ground despite differences.\n\n🔹 Respond in a calm and logical manner, and avoid reacting emotionally to the accusation and maintain a focus on the substance of the discussion.\n\n🔹 Emphasize shared goals or objectives, reinforcing the idea that the discussion is aimed at finding solutions or common understanding rather than assigning blame."
        )
    ]
}
