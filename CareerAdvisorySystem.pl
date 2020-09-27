getCourses([Course | List]) :-
	writeln('Enter Course'),
	read(Course),
	dif(Course, stop),
	getCourses(List).

getCourses([]).

removeDuplicates([], []).
removeDuplicates([Head | Tail], Result) :-
	member(Head, Tail), !,
	removeDuplicates(Tail, Result).
removeDuplicates([Head | Tail], [Head | Result]) :-
	removeDuplicates(Tail, Result).

getAcademicDetails :-
	writeln("What is your branch at IIITD?"), 
	read(Branch), ignore(getCSE), ignore(getECE), 
	ignore(getBIO), 
	ignore(getDES), 
	ignore(getSSH), 
	ignore(getCGPA),
	ignore(getBTP), 
	ignore(getExtraCredits),
	choiceMaster(Branch).

getCSE :-
	writeln("How many Computer Science course have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(cse)).

getECE :-
	writeln("How many Electronics and Communication courses have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(ece)).

getMTH :-
	writeln("How many Mathematics courses have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(mth)).

getBIO :-
	writeln("How many Biology courses have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(bio)).

getDES :-
	writeln("How many Design courses have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(des)).

getSSH :-
	writeln("How many Social Science and Economics courses have you taken?"),
	read(Num),
	Num >= 6,
	assert(academic_interest(ssh)).

getCGPA :- 
	writeln("What is you CGPA?"),
	read(Num),
	((Num >= 9,
		assert(cgpa(high)));
	(Num >= 8,
		assert(cgpa(above_average)));
	(Num >= 7,
		assert(cgpa(average)));
	(Num >= 6,
		assert(cgpa(below_average)));
	(assert(cgpa(low)))).

getBTP :-
	writeln("Have you taken a BTP?"),
	read(Val),
	Val == yes,
	assert(btp(yes)).
getExtraCredits :-
	writeln("Have you taken any extra credits?"),
	read(Val),
	Val == yes,
	assert(extraCredits(yes)).

init :-
	retracteverything, getAcademicDetails.

retracteverything :-
	ignore(retractall(academic_interest(_))),
	ignore(retractall(cgpa(_))),
	ignore(retractall(research(_))).

choiceMaster(_) :-
	writeln("Would you also like to explore careers outside your branch?"),
	read(Val),
	Val == yes,
	!,
	ignore(exploreCSE),
	ignore(exploreECE),
	ignore(exploreMTH),
	ignore(exploreBIO),
	ignore(exploreDES),
	ignore(exploreSSH).

choiceMaster(Branch) :-
	branch(Branch).

branch(cse) :-
	ignore(choiceAI),
	ignore(choiceDS),
	ignore(choiceSD),
	ignore(choiceCN),
	ignore(choiceCAOS),
	ignore(noMoreChoices).

branch(ece) :-
	ignore(choiceNet),
	ignore(choiceEmbed),
	ignore(choiceChips),
	ignore(noMoreChoices).

branch(csam) :-
	ignore(choiceCrypto),
	ignore(choiceLogic),
	ignore(choiceCalculus),
	ignore(noMoreChoices).

branch(csb) :-
	ignore(choiceBiology),
	ignore(noMoreChoices).

branch(csd) :-
	ignore(choiceGraphic),
	ignore(choiceVideo),
	ignore(choiceFront),
	ignore(choiceHCD),
	ignore(noMoreChoices).

branch(csss) :-
	ignore(choiceEcon),
	ignore(choiceSocio),
	ignore(choicePsych),
	ignore(choiceLiberal),
	ignore(noMoreChoices).

exploreCSE :-
	academic_interest(cse),
	branch(cse).

exploreECE :-
	academic_interest(ece),
	branch(ece).

exploreMTH :-
	academic_interest(mth),
	branch(csam).

exploreBIO :-
	academic_interest(bio),
	branch(csb).

exploreDES :-
	academic_interest(des),
	branch(csd).

exploreSSH :-
	academic_interest(ssh),
	branch(csss).

choiceAI :-
	writeln("Have you taken a course on or know propositional and predicate/first-orderlogic?"),
	read(Val),
	Val == yes,
	writeln("Have you heard of Logic Programming?"),
	read(Val),
	Val == yes,
	writeln("Are you interested in Artificial Intelligence?"),
	read(Val),
	Val == yes,
	writeln("Have you taken an AI course or worked on any AI projects?"),
	read(Val),
	Val == yes,
	writeln("Since you have a knowledge of propositional, predicate/first-order logic, logic programming and an interest in Artificial Intelligence and have also taken an AI course/ worked on AI projects, you may consider a career in AI."),
	outcome.

choiceDS :-
	writeln("Do you have a knowledge of statistics?"),
	read(Val),
	Val == yes,
	writeln("Do you know languages like Python or R?"),
	read(Val),
	Val == yes,
	writeln("Are you interested in Data Science/ Machine Learning?"),
	read(Val),
	Val == yes,
	writeln("Have you participated in contests like Kaggle?"),
	read(Val),
	Val == yes,
	writeln("Have you taken a DS/ML course or worked on any DS/ML projects?"),
	read(Val),
	Val == yes,
	writeln("Since you have a knowledge of statistics and know languages like Python or R which are very popular in the DS & ML fields, you have also have an interest in DS/ML having participated in Kaggle contests, also taken a course/ worked on DS/ML projects. you may consider a career in Data Science or Machine Learning."),
	outcome.

choiceSD :-
	writeln("Have you used Object Oriented Programming?"),
	read(Val),
	Val == yes,
	writeln("Do you like to create applications?"),
	read(Val),
	Val == yes,
	writeln("Do you know Java or C++?"),
	read(Val),
	Val == yes,
	writeln("Do you have a good knowledge of DSA?"),
	read(Val),
	Val == yes,
	writeln("Do you know recognise terms like Docker, GitHub, Full Stack, SQL, NO SQL?"),
	read(Val),
	Val == yes,
	writeln("Since you like creating huge full stack applications with a knowledge of current technologies, you should consider a career in Software Engineering like mobile application development, web development, video game development, etc."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceCN :-
	writeln("Do you know the difference between WWW and the Internet?"),
	read(Val),
	Val == yes,
	writeln("Do you know how the Internet works?"),
	read(Val),
	Val == yes,
	writeln("Do you know about private or public key encryption?"),
	read(Val),
	Val == yes,
	writeln("Are you interested in Computer Network or Network Security?"),
	read(Val),
	Val == yes,
	writeln("Since you have a good grip over concepts of networks and their security, you also have an interest in the field, you should consider a career in Computer Networks."),
	outcome.

choiceCAOS :-
	writeln("Do you know about ARM/x86 architectures?"),
	read(Val),
	Val == yes,
	writeln("Have you used Linux?"),
	read(Val),
	Val == yes,
	writeln("Do you know OS concepts like scheduling, bootstrapping, paging, etc?"),
	read(Val),
	Val == yes,
	writeln("Have you taken a course on Operating Systems or Computer Organisation?"),
	read(Val),
	Val == yes,
	writeln("Since you have a good knowledge of computer architecture and operating systems, you may want to consider following a career path in the Computer Architecture and Operating Systems."),
	outcome.

choiceNet :-
	writeln("Do you know about wireless, satellite communication technologies?"),
	read(Val),
	Val == yes,
	writeln("Have you ever worked with/ fixed networking equipment?"),
	read(Val),
	Val == yes,
	writeln("Are you interested in working in the telecom industry?"),
	read(Val),
	Val == yes,
	writeln("Since you have a good knowledge of networking hardware, wireless communication technologies, you should consider a career in the Telecommunications field."),
	outcome.

choiceEmbed :-
	writeln("Do you like working with miniature mechanical and electronic components like Arduino, Raspberry Pi, logic boards, etc?"),
	read(Val),
	Val == yes,
	writeln("Do you have a knowledge of IoT (Internet Of Things)?"),
	read(Val),
	Val == yes,
	writeln("Do you know C/C++ programming?"),
	read(Val),
	Val == yes,
	writeln("Since you have worked with miniature electronic components, have a knowledge of IoT and C/C++ programming, you should consider a career in embedded systems."),
	outcome.

choiceChips :-
	writeln("Do you know VLSI (Verilog)?"),
	read(Val),
	Val == yes,
	writeln("Do you know DSP (Digital Signal Processing)?"),
	read(Val),
	Val == yes,
	writeln("Do you have a good knowledge and interest in Digital Circuits?"),
	read(Val),
	Val == yes,
	writeln("Do you also have some knowledge of Computer Architecture and Organisation?"),
	read(Val),
	Val == yes,
	writeln("You have all the required prerequisites, VLSI, DSP, DC, CA, CO for a career in Integrated Circuit Design."),
	outcome.

choiceCrypto :-
	writeln("Do you have a good grasp on Discrete Structures?"),
	read(Val),
	Val == yes,
	writeln("Do you know/ have taken a course on Number Theory?"),
	read(Val),
	Val == yes,
	writeln("Do you have knowledge of field theory and ring theory?"),
	read(Val),
	Val == yes,
	writeln("Are you interested in Computer/Network security?"),
	read(Val),
	Val == yes,
	writeln("With your extensive knowledge of discrete math and a keen interest in computer/network security, you should consider a career in applied cryptography."),
	outcome.

choiceLogic :-
	writeln("Do you have prefer theoretical knowledge rather than dwelling over implementation details?"),
	read(Val),
	Val == yes,
	(cgpa(high); cgpa(above_average)),
	writeln("Do you know first-order, second-order logic, higher-order logic and type theory?"),
	read(Val),
	Val == yes,
	writeln("Do you also know about other forms of logic like epistemic, temporal, fuzzy logic?"),
	read(Val),
	Val == yes,
	writeln("You should consider going into mathematical research, particularly mathematical logic. You also have a high enough cgpa to pursue a career in the field."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceCalculus :-
	(cgpa(average); cgpa(above_average); cgpa(high)),
	writeln("Are you quick in arithmetic?"),
	read(Val),
	Val == yes,
	writeln("Do you have taken a course/ good knowledge of Linear Algebra?"),
	read(Val),
	Val == yes,
	writeln("Do you have taken a course/ good knowledge of Probability?"),
	read(Val),
	Val == yes,
	writeln("Do you have taken a course/ good knowledge of Calculus?"),
	read(Val),
	Val == yes,
	writeln("Are you also interested in Economics"),
	read(Val),
	Val == yes,
	writeln("Your good knowledge of foundational mathematics courses and quick arithmetic skills along with an interest in Economics, a career in finance would suit you particularly investment banking."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceBiology :-
	writeln("Are you interested in medicine, healthcare, drug and vaccine, etc."),
	read(Val),
	Val == yes,
	writeln("Are you proficient in running mathematical models and simulations?"),
	read(Val),
	Val == yes,
	writeln("Do you have knowledge of/ taken a course in advanced algorithms?"),
	read(Val),
	Val == yes,
	writeln("With your interest in medicine and healthcare, proficiency in mathematical modelling and simulations, knowledge/course in advanced algorithms, you should take a look at Computational Biology."),
	outcome.

choiceEcon :-
	writeln("Do you know who is John Nash?"),
	read(Val),
	Val == yes,
	writeln("Are you interested to go into Economics research?"),
	read(Val),
	Val == yes,
	writeln("Have you taken a course on Game Theory?"),
	read(Val),
	Val == yes,
	writeln("You should look into Mathematical Economics particularly Game Theory"),
	writeln(" "),
	writeln("Now looking for other options.").

choicePsych :-
	writeln("Do you think you have an innate ability to empathise with people?"),
	read(Val),
	Val == yes,
	writeln("Do you think Emotional Intelligence is important?"),
	read(Val),
	Val == yes,
	writeln("Are you good at communicating with people?"),
	read(Val),
	Val == yes,
	writeln("With your people skills and ability to empathise with others along with being aware of concepts like Emotional Intelligence, you should explore a career in Psychology."),
	outcome.

choiceLiberal :-
	writeln("Do you like participating in debates?"),
	read(Val),
	Val == yes,
	writeln("Do you think critical thinking is important?"),
	read(Val),
	Val == yes,
	writeln("Do you keep yourself aware of what's happening in the world?"),
	read(Val),
	Val == yes,
	writeln("You seem to be interested in liberal arts. Therefore, you are recommended to pursue research in the SSH field."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceGraphic :-
	writeln("Do you know how to use Photoshop or Illustrator?"),
	read(Val),
	Val == yes,
	writeln("Do you know the Gestalt principles?"),
	read(Val),
	Val == yes,
	writeln("Have you ever done some freelance work/Fiverr?"),
	read(Val),
	Val == yes,
	writeln("With the above graphic design skills and knowledge, you should become a graphic designer."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceVideo :-
	writeln("Have you used Premiere Pro or Da Vinci Resolve?"),
	read(Val),
	Val == yes,
	writeln("Do you know the theory behind non-linear editing?"),
	read(Val),
	Val == yes,
	writeln("Do you have any knowledge of cinematography?"),
	read(Val),
	Val == yes,
	writeln("You have good video editing skills, you may look for a career in cinematography or editing, director of photography would also be a nice fit."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceFront :-
	writeln("Do you know HTML, CSS and JavaScript?"),
	read(Val),
	Val == yes,
	writeln("Have you used any web frameworks like Bootstrap and React?"),
	read(Val),
	Val == yes,
	writeln("Are you ready to work in a field where technology may change daily and you will have to adapt?"),
	read(Val),
	Val == yes,
	writeln("With your web development skills and design eye along with your adaptability, you should look for a career in Front End Web Development."),
	writeln(" "),
	writeln("Now looking for other options.").

choiceHCD :-
	writeln("Have you taken a course in Human Computer Interaction?"),
	read(Val),
	Val == yes,
	writeln("Have you undergone a complete design process when developing a service or a product?"),
	read(Val),
	Val == yes,
	writeln("Have you taken a course in Design Thinking?"),
	read(Val),
	Val == yes,
	writeln("With your knowledge of a design process and critical design thinking along with having taken a course in HCI, you should seriously a careed in HCD (Human Centered Design)."),
	outcome.

outcome :-
	cgpa(high),
	btp(yes),
	extraCredits(yes),
	writeln("You should go the research route due to your high CGPA, having taken extra credits and done a BTech project."),
	writeln(" "),
	writeln("Now looking for other options.").

outcome :-
	((cgpa(above_average), (btp(yes); extraCredits(yes))); 
		cgpa(high)),
	writeln("You should consider doing a Masters in the field and then make a decision whether to go into industry or research."),
	writeln(" "),
	writeln("Now looking for other options.").

outcome :-
	(cgpa(above_average); cgpa(average)),
	writeln("You should consider working in the industry."),
	writeln(" "),
	writeln("Now looking for other options.").

outcome :-
	(cgpa(below_average); cgpa(low)),
	writeln("To find a good career in the field, you should work on improving your CGPA."),
	writeln(" "),
	writeln("Now looking for other options.").

noMoreChoices :-
	writeln("Unfortunately, there are no more career paths left to recommend.").