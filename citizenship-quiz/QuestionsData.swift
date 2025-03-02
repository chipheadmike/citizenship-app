//
//  QuestionsData.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/2/25.
//

// QuestionsData.swift
// QuestionsData.swift
import Foundation

struct QuestionsData {
    static let all: [Question] = [
        Question(
            text: "What is the supreme law of the land?",
            correctAnswer: "The Constitution",
            wrongAnswers: [
                "The Declaration of Independence",
                "The Bill of Rights",
                "The Federalist Papers"
            ]
        ),
        Question(
            text: "What does the Constitution do?",
            correctAnswer: "Sets up the government",
            wrongAnswers: [
                "Declares independence from Britain",
                "Abolishes slavery",
                "Establishes state capitals"
            ]
        ),
        Question(
            text: "The idea of self-government is in the first three words of the Constitution. What are these words?",
            correctAnswer: "\"We the People\"",
            wrongAnswers: [
                "\"Life, Liberty, Happiness\"",
                "\"In God We Trust\"",
                "\"Four score and\""
            ]
        ),
        Question(
            text: "What is an amendment?",
            correctAnswer: "A change to the Constitution",
            wrongAnswers: [
                "A new state law",
                "A presidential decree",
                "A Supreme Court ruling"
            ]
        ),
        Question(
            text: "What do we call the first ten amendments to the Constitution?",
            correctAnswer: "The Bill of Rights",
            wrongAnswers: [
                "The Articles of Confederation",
                "The Federalist Papers",
                "The Magna Carta"
            ]
        ),
        Question(
            text: "What is one right or freedom from the First Amendment?",
            correctAnswer: "Speech",
            wrongAnswers: [
                "Right to bear arms",
                "Right to vote",
                "Trial by jury"
            ]
        ),
        Question(
            text: "How many amendments does the Constitution have?",
            correctAnswer: "27",
            wrongAnswers: [
                "15",
                "10",
                "50"
            ]
        ),
        Question(
            text: "What did the Declaration of Independence do?",
            correctAnswer: "Announced our independence from Great Britain",
            wrongAnswers: [
                "Ended the Civil War",
                "Established the Constitution",
                "Freed the slaves"
            ]
        ),
        Question(
            text: "What are two rights in the Declaration of Independence?",
            correctAnswer: "Life and liberty",
            wrongAnswers: [
                "Speech and press",
                "Voting and assembly",
                "Education and healthcare"
            ]
        ),
        Question(
            text: "What is freedom of religion?",
            correctAnswer: "You can practice any religion, or not practice a religion",
            wrongAnswers: [
                "You must follow the state religion",
                "Only Christianity is allowed",
                "Religion is banned"
            ]
        ),
        Question(
            text: "What is the economic system in the United States?",
            correctAnswer: "Capitalist economy",
            wrongAnswers: [
                "Socialist economy",
                "Communist economy",
                "Barter system"
            ]
        ),
        Question(
            text: "What is the \"rule of law\"?",
            correctAnswer: "Everyone must follow the law",
            wrongAnswers: [
                "Only leaders must obey the law",
                "Laws only apply to citizens",
                "The president is above the law"
            ]
        ),
        Question(
            text: "Name one branch or part of the government.",
            correctAnswer: "Legislative",
            wrongAnswers: [
                "Military",
                "Media",
                "Education"
            ]
        ),
        Question(
            text: "What stops one branch of government from becoming too powerful?",
            correctAnswer: "Checks and balances",
            wrongAnswers: [
                "Political parties",
                "Public opinion",
                "State governments"
            ]
        ),
        Question(
            text: "Who is in charge of the executive branch?",
            correctAnswer: "The President",
            wrongAnswers: [
                "The Speaker of the House",
                "The Chief Justice",
                "The Senate Majority Leader"
            ]
        ),
        Question(
            text: "Who makes federal laws?",
            correctAnswer: "Congress",
            wrongAnswers: [
                "The Supreme Court",
                "The President",
                "The Cabinet"
            ]
        ),
        Question(
            text: "What are the two parts of the U.S. Congress?",
            correctAnswer: "Senate and House of Representatives",
            wrongAnswers: [
                "Army and Navy",
                "Supreme Court and Cabinet",
                "Governors and Mayors"
            ]
        ),
        Question(
            text: "How many U.S. Senators are there?",
            correctAnswer: "100",
            wrongAnswers: [
                "50",
                "435",
                "27"
            ]
        ),
        Question(
            text: "We elect a U.S. Senator for how many years?",
            correctAnswer: "6",
            wrongAnswers: [
                "2",
                "4",
                "8"
            ]
        ),
        Question(
            text: "Who is one of your state’s U.S. Senators now?",
            correctAnswer: "[Your State’s Senator]",
            wrongAnswers: [
                "George Washington",
                "Abraham Lincoln",
                "Thomas Jefferson"
            ]
        ),
        Question(
            text: "The House of Representatives has how many voting members?",
            correctAnswer: "435",
            wrongAnswers: [
                "100",
                "50",
                "270"
            ]
        ),
        Question(
            text: "We elect a U.S. Representative for how many years?",
            correctAnswer: "2",
            wrongAnswers: [
                "4",
                "6",
                "8"
            ]
        ),
        Question(
            text: "Name your U.S. Representative.",
            correctAnswer: "[Your Representative]",
            wrongAnswers: [
                "Benjamin Franklin",
                "John Adams",
                "James Madison"
            ]
        ),
        Question(
            text: "Who does a U.S. Senator represent?",
            correctAnswer: "All people of their state",
            wrongAnswers: [
                "Only their political party",
                "The federal government",
                "Only city residents"
            ]
        ),
        Question(
            text: "Why do some states have more Representatives than other states?",
            correctAnswer: "Because of the state’s population",
            wrongAnswers: [
                "Because of the state’s size",
                "Because of the state’s wealth",
                "Because of historical events"
            ]
        ),
        Question(
            text: "We elect a President for how many years?",
            correctAnswer: "4",
            wrongAnswers: [
                "2",
                "6",
                "8"
            ]
        ),
        Question(
            text: "In what month do people vote for President?",
            correctAnswer: "November",
            wrongAnswers: [
                "February",
                "July",
                "April"
            ]
        ),
        Question(
            text: "What is the name of the President of the United States now?",
            correctAnswer: "Donald Trump",
            wrongAnswers: [
                "Barack Obama",
                "George W. Bush",
                "Joe Biden"
            ]
        ),
        Question(
            text: "What is the name of the Vice President of the United States now?",
            correctAnswer: "J.D. Vance",
            wrongAnswers: [
                "Mike Pence",
                "Kamala Harris",
                "Dick Cheney"
            ]
        ),
        Question(
            text: "If the President can no longer serve, who becomes President?",
            correctAnswer: "The Vice President",
            wrongAnswers: [
                "The Speaker of the House",
                "The Chief Justice",
                "The Secretary of State"
            ]
        ),
        Question(
            text: "If both the President and Vice President can no longer serve, who becomes President?",
            correctAnswer: "The Speaker of the House",
            wrongAnswers: [
                "The Attorney General",
                "The Senate Majority Leader",
                "The Secretary of Defense"
            ]
        ),
        Question(
            text: "Who is the Commander in Chief of the military?",
            correctAnswer: "The President",
            wrongAnswers: [
                "The Secretary of Defense",
                "The Chairman of the Joint Chiefs",
                "The Vice President"
            ]
        ),
        Question(
            text: "Who signs bills to become laws?",
            correctAnswer: "The President",
            wrongAnswers: [
                "The Chief Justice",
                "The Speaker of the House",
                "The Senate Majority Leader"
            ]
        ),
        Question(
            text: "Who vetoes bills?",
            correctAnswer: "The President",
            wrongAnswers: [
                "The Vice President",
                "The Supreme Court",
                "Congress"
            ]
        ),
        Question(
            text: "What does the President’s Cabinet do?",
            correctAnswer: "Advises the President",
            wrongAnswers: [
                "Makes laws",
                "Interprets laws",
                "Commands the military"
            ]
        ),
        Question(
            text: "What are two Cabinet-level positions?",
            correctAnswer: "Secretary of State and Secretary of Defense",
            wrongAnswers: [
                "Mayor and Governor",
                "Senator and Representative",
                "Judge and Sheriff"
            ]
        ),
        Question(
            text: "What does the judicial branch do?",
            correctAnswer: "Reviews laws",
            wrongAnswers: [
                "Makes laws",
                "Enforces laws",
                "Vetoes laws"
            ]
        ),
        Question(
            text: "What is the highest court in the United States?",
            correctAnswer: "The Supreme Court",
            wrongAnswers: [
                "The Federal Appeals Court",
                "The District Court",
                "The State Supreme Court"
            ]
        ),
        Question(
            text: "How many justices are on the Supreme Court?",
            correctAnswer: "9",
            wrongAnswers: [
                "7",
                "12",
                "5"
            ]
        ),
        Question(
            text: "Who is the Chief Justice of the United States now?",
            correctAnswer: "John G. Roberts, Jr.",
            wrongAnswers: [
                "Clarence Thomas",
                "Sonia Sotomayor",
                "Brett Kavanaugh"
            ]
        ),
        Question(
            text: "Under our Constitution, some powers belong to the federal government. What is one power of the federal government?",
            correctAnswer: "To print money",
            wrongAnswers: [
                "To issue driver’s licenses",
                "To build schools",
                "To set property taxes"
            ]
        ),
        Question(
            text: "Under our Constitution, some powers belong to the states. What is one power of the states?",
            correctAnswer: "Provide education",
            wrongAnswers: [
                "Declare war",
                "Coin money",
                "Negotiate treaties"
            ]
        ),
        Question(
            text: "Who is the Governor of your state now?",
            correctAnswer: "[Your State’s Governor]",
            wrongAnswers: [
                "Thomas Jefferson",
                "Alexander Hamilton",
                "Andrew Jackson"
            ]
        ),
        Question(
            text: "What is the capital of your state?",
            correctAnswer: "[Your State’s Capital]",
            wrongAnswers: [
                "New York",
                "Florida",
                "California"
            ]
        ),
        Question(
            text: "What are the two major political parties in the United States?",
            correctAnswer: "Democratic and Republican",
            wrongAnswers: [
                "Liberal and Conservative",
                "Socialist and Communist",
                "Green and Libertarian"
            ]
        ),
        Question(
            text: "What is the political party of the President now?",
            correctAnswer: "Republican",
            wrongAnswers: [
                "Democratic",
                "Independent",
                "Green"
            ]
        ),
        Question(
            text: "What is the name of the Speaker of the House of Representatives now?",
            correctAnswer: "Mike Johnson",
            wrongAnswers: [
                "Nancy Pelosi",
                "Kevin McCarthy",
                "Paul Ryan"
            ]
        ),
        Question(
            text: "There are four amendments to the Constitution about who can vote. Describe one of them.",
            correctAnswer: "Citizens eighteen (18) and older can vote",
            wrongAnswers: [
                "Only men can vote",
                "You must own land to vote",
                "Only white citizens can vote"
            ]
        ),
        Question(
            text: "What is one responsibility that is only for United States citizens?",
            correctAnswer: "Serve on a jury",
            wrongAnswers: [
                "Pay taxes",
                "Obey laws",
                "Attend school"
            ]
        ),
        Question(
            text: "Name one right only for United States citizens.",
            correctAnswer: "Vote in a federal election",
            wrongAnswers: [
                "Freedom of speech",
                "Freedom of religion",
                "Right to a fair trial"
            ]
        ),
        Question(
            text: "What are two rights of everyone living in the United States?",
            correctAnswer: "Freedom of speech and freedom of religion",
            wrongAnswers: [
                "Voting and running for office",
                "Driving and owning property",
                "Education and healthcare"
            ]
        ),
        Question(
            text: "We elect a President every four years. What is this an example of?",
            correctAnswer: "Democratic process",
            wrongAnswers: [
                "Checks and balances",
                "Federalism",
                "Judicial review"
            ]
        ),
        Question(
            text: "What do we show loyalty to when we say the Pledge of Allegiance?",
            correctAnswer: "The United States",
            wrongAnswers: [
                "The President",
                "The Constitution",
                "The military"
            ]
        ),
        Question(
            text: "What is one promise you make when you become a United States citizen?",
            correctAnswer: "Give up loyalty to other countries",
            wrongAnswers: [
                "Pay higher taxes",
                "Serve in the military for life",
                "Move to a big city"
            ]
        ),
        Question(
            text: "How old do citizens have to be to vote for President?",
            correctAnswer: "18",
            wrongAnswers: [
                "16",
                "21",
                "25"
            ]
        ),
        Question(
            text: "What are two ways that Americans can participate in their democracy?",
            correctAnswer: "Vote and run for office",
            wrongAnswers: [
                "Drive and work",
                "Pray and travel",
                "Shop and volunteer"
            ]
        ),
        Question(
            text: "When is the last day you can send in federal income tax forms?",
            correctAnswer: "April 15",
            wrongAnswers: [
                "July 4",
                "December 31",
                "January 1"
            ]
        ),
        Question(
            text: "When must all men register for the Selective Service?",
            correctAnswer: "At age 18",
            wrongAnswers: [
                "At age 21",
                "At age 25",
                "At birth"
            ]
        ),
        Question(
            text: "What is one reason colonists came to America?",
            correctAnswer: "Religious freedom",
            wrongAnswers: [
                "Better weather",
                "Free education",
                "Lower taxes"
            ]
        ),
        Question(
            text: "Who lived in America before the Europeans arrived?",
            correctAnswer: "Native Americans",
            wrongAnswers: [
                "British settlers",
                "Spanish conquistadors",
                "French explorers"
            ]
        ),
        Question(
            text: "What group of people was taken to America and sold as slaves?",
            correctAnswer: "Africans",
            wrongAnswers: [
                "Asians",
                "Europeans",
                "Australians"
            ]
        ),
        Question(
            text: "Why did the colonists fight the British?",
            correctAnswer: "Because of high taxes",
            wrongAnswers: [
                "To gain more land",
                "To free the slaves",
                "To join the French"
            ]
        ),
        Question(
            text: "Who wrote the Declaration of Independence?",
            correctAnswer: "Thomas Jefferson",
            wrongAnswers: [
                "George Washington",
                "Abraham Lincoln",
                "Benjamin Franklin"
            ]
        ),
        Question(
            text: "When was the Declaration of Independence adopted?",
            correctAnswer: "July 4, 1776",
            wrongAnswers: [
                "July 4, 1789",
                "December 15, 1791",
                "September 17, 1787"
            ]
        ),
        Question(
            text: "There were 13 original states. Name three.",
            correctAnswer: "New York, Virginia, Massachusetts",
            wrongAnswers: [
                "Florida, Texas, California",
                "Alaska, Hawaii, Arizona",
                "Kansas, Nebraska, Oklahoma"
            ]
        ),
        Question(
            text: "What happened at the Constitutional Convention?",
            correctAnswer: "The Constitution was written",
            wrongAnswers: [
                "The Declaration was signed",
                "Slavery was abolished",
                "The Bill of Rights was repealed"
            ]
        ),
        Question(
            text: "When was the Constitution written?",
            correctAnswer: "1787",
            wrongAnswers: [
                "1776",
                "1865",
                "1800"
            ]
        ),
        Question(
            text: "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers.",
            correctAnswer: "James Madison",
            wrongAnswers: [
                "Thomas Paine",
                "Patrick Henry",
                "John Hancock"
            ]
        ),
        Question(
            text: "What is one thing Benjamin Franklin is famous for?",
            correctAnswer: "U.S. diplomat",
            wrongAnswers: [
                "Writing the Constitution",
                "Leading the Civil War",
                "Inventing the light bulb"
            ]
        ),
        Question(
            text: "Who is the “Father of Our Country”?",
            correctAnswer: "George Washington",
            wrongAnswers: [
                "Abraham Lincoln",
                "Thomas Jefferson",
                "John Adams"
            ]
        ),
        Question(
            text: "Who was the first President?",
            correctAnswer: "George Washington",
            wrongAnswers: [
                "John Adams",
                "Thomas Jefferson",
                "James Madison"
            ]
        ),
        Question(
            text: "What territory did the United States buy from France in 1803?",
            correctAnswer: "Louisiana",
            wrongAnswers: [
                "Florida",
                "Texas",
                "California"
            ]
        ),
        Question(
            text: "Name one war fought by the United States in the 1800s.",
            correctAnswer: "Civil War",
            wrongAnswers: [
                "World War I",
                "Vietnam War",
                "Korean War"
            ]
        ),
        Question(
            text: "Who was President during the Civil War?",
            correctAnswer: "Abraham Lincoln",
            wrongAnswers: [
                "Andrew Jackson",
                "Ulysses S. Grant",
                "Theodore Roosevelt"
            ]
        ),
        Question(
            text: "What did the Emancipation Proclamation do?",
            correctAnswer: "Freed slaves in the Confederacy",
            wrongAnswers: [
                "Ended the Revolutionary War",
                "Gave women the right to vote",
                "Established the Constitution"
            ]
        ),
        Question(
            text: "What did Susan B. Anthony do?",
            correctAnswer: "Fought for women’s rights",
            wrongAnswers: [
                "Invented the telephone",
                "Led the Underground Railroad",
                "Wrote the Bill of Rights"
            ]
        ),
        Question(
            text: "Name one war fought by the United States in the 1900s.",
            correctAnswer: "World War II",
            wrongAnswers: [
                "Revolutionary War",
                "War of 1812",
                "Mexican-American War"
            ]
        ),
        Question(
            text: "Who was President during World War I?",
            correctAnswer: "Woodrow Wilson",
            wrongAnswers: [
                "Franklin Roosevelt",
                "Herbert Hoover",
                "Harry Truman"
            ]
        ),
        Question(
            text: "Who was President during the Great Depression and World War II?",
            correctAnswer: "Franklin Roosevelt",
            wrongAnswers: [
                "Calvin Coolidge",
                "Dwight Eisenhower",
                "Lyndon Johnson"
            ]
        ),
        Question(
            text: "Who did the United States fight in World War II?",
            correctAnswer: "Germany, Japan, Italy",
            wrongAnswers: [
                "Russia, China, Korea",
                "France, Spain, Britain",
                "Canada, Mexico, Cuba"
            ]
        ),
        Question(
            text: "Before he was President, Eisenhower was a general. What war was he in?",
            correctAnswer: "World War II",
            wrongAnswers: [
                "World War I",
                "Civil War",
                "Korean War"
            ]
        ),
        Question(
            text: "During the Cold War, what was the main concern of the United States?",
            correctAnswer: "Communism",
            wrongAnswers: [
                "Climate change",
                "Immigration",
                "Trade deficits"
            ]
        ),
        Question(
            text: "What movement tried to end racial discrimination?",
            correctAnswer: "Civil Rights Movement",
            wrongAnswers: [
                "Women’s Suffrage",
                "Prohibition",
                "Abolitionist Movement"
            ]
        ),
        Question(
            text: "What did Martin Luther King, Jr. do?",
            correctAnswer: "Fought for civil rights",
            wrongAnswers: [
                "Invented the airplane",
                "Led the American Revolution",
                "Wrote the Constitution"
            ]
        ),
        Question(
            text: "What major event happened on September 11, 2001, in the United States?",
            correctAnswer: "Terrorists attacked the United States",
            wrongAnswers: [
                "The stock market crashed",
                "The Iraq War began",
                "Hurricane Katrina hit"
            ]
        ),
        Question(
            text: "Name one American Indian tribe in the United States.",
            correctAnswer: "Cherokee",
            wrongAnswers: [
                "Viking",
                "Roman",
                "Phoenician"
            ]
        ),
        Question(
            text: "Name one of the two longest rivers in the United States.",
            correctAnswer: "Mississippi River",
            wrongAnswers: [
                "Hudson River",
                "Colorado River",
                "Rio Grande"
            ]
        ),
        Question(
            text: "What ocean is on the West Coast of the United States?",
            correctAnswer: "Pacific Ocean",
            wrongAnswers: [
                "Atlantic Ocean",
                "Indian Ocean",
                "Arctic Ocean"
            ]
        ),
        Question(
            text: "What ocean is on the East Coast of the United States?",
            correctAnswer: "Atlantic Ocean",
            wrongAnswers: [
                "Pacific Ocean",
                "Gulf of Mexico",
                "Southern Ocean"
            ]
        ),
        Question(
            text: "Name one U.S. territory.",
            correctAnswer: "Puerto Rico",
            wrongAnswers: [
                "Florida",
                "Texas",
                "Hawaii"
            ]
        ),
        Question(
            text: "Name one state that borders Canada.",
            correctAnswer: "New York",
            wrongAnswers: [
                "California",
                "Texas",
                "Florida"
            ]
        ),
        Question(
            text: "Name one state that borders Mexico.",
            correctAnswer: "Texas",
            wrongAnswers: [
                "New York",
                "Alaska",
                "Maine"
            ]
        ),
        Question(
            text: "What is the capital of the United States?",
            correctAnswer: "Washington, D.C.",
            wrongAnswers: [
                "New York City",
                "Los Angeles",
                "Chicago"
            ]
        ),
        Question(
            text: "Where is the Statue of Liberty?",
            correctAnswer: "New York",
            wrongAnswers: [
                "Florida",
                "California",
                "Texas"
            ]
        ),
        Question(
            text: "Why does the flag have 13 stripes?",
            correctAnswer: "For the 13 original colonies",
            wrongAnswers: [
                "For the 13 amendments",
                "For the 13 states today",
                "For the 13 presidents"
            ]
        ),
        Question(
            text: "Why does the flag have 50 stars?",
            correctAnswer: "For the 50 states",
            wrongAnswers: [
                "For the 50 senators",
                "For the 50 amendments",
                "For the 50 years of independence"
            ]
        ),
        Question(
            text: "What is the name of the national anthem?",
            correctAnswer: "“The Star-Spangled Banner”",
            wrongAnswers: [
                "“Sweet Home Alabama”",
                "“America the Beautiful”",
                "“God Bless America”"
            ]
        ),
        Question(
            text: "When do we celebrate Independence Day?",
            correctAnswer: "July 4",
            wrongAnswers: [
                "December 25",
                "November 11",
                "January 1"
            ]
        ),
        Question(
            text: "Name two national U.S. holidays.",
            correctAnswer: "Independence Day and Thanksgiving",
            wrongAnswers: [
                "Halloween and Easter",
                "Valentine’s Day and St. Patrick’s Day",
                "Arbor Day and Earth Day"
            ]
        ),
        Question(
            text: "Who can vote in the United States?",
            correctAnswer: "Citizens 18 and older",
            wrongAnswers: [
                "Anyone living in the U.S.",
                "Only taxpayers",
                "Only property owners"
            ]
        )
    ]
}
