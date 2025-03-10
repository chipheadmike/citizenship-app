//
//  USCISData.swift
//  citizenship-quiz
//
//  Created by Mike Williams on 3/5/25.
//

import Foundation

struct USCISData {
    static let all: [USCISQuestion] = [
        // 1
        USCISQuestion(
            text: "What is the supreme law of the land?",
            possibleCorrectAnswers: [
                "The Constitution"
            ],
            possibleWrongAnswers: [
                "The Bill of Rights",
                "The Declaration of Independence",
                "The Articles of Confederation"
            ]
        ),
        // 2
        USCISQuestion(
            text: "What does the Constitution do?",
            possibleCorrectAnswers: [
                "Sets up the government",
                "Defines the government",
                "Protects basic rights of Americans"
            ],
            possibleWrongAnswers: [
                "Declares independence from Britain",
                "Establishes trade laws",
                "Grants citizenship to all residents"
            ]
        ),
        // 3
        USCISQuestion(
            text: "The idea of self-government is in the first three words of the Constitution. What are these words?",
            possibleCorrectAnswers: [
                "We the People"
            ],
            possibleWrongAnswers: [
                "Life, Liberty, Pursuit",
                "United States Constitution",
                "In God We"
            ]
        ),
        // 4
        USCISQuestion(
            text: "What is an amendment?",
            possibleCorrectAnswers: [
                "A change to the Constitution",
                "An addition to the Constitution"
            ],
            possibleWrongAnswers: [
                "A new law passed by Congress",
                "A state’s constitution",
                "A presidential order"
            ]
        ),
        // 5
        USCISQuestion(
            text: "What do we call the first ten amendments to the Constitution?",
            possibleCorrectAnswers: [
                "The Bill of Rights"
            ],
            possibleWrongAnswers: [
                "The Founding Principles",
                "The Federalist Papers",
                "The Preamble Amendments"
            ]
        ),
        // 6
        USCISQuestion(
            text: "What is one right or freedom from the First Amendment?",
            possibleCorrectAnswers: [
                "Speech",
                "Religion",
                "Assembly",
                "Press",
                "Petition the government"
            ],
            possibleWrongAnswers: [
                "Voting",
                "Privacy",
                "Education"
            ]
        ),
        // 7
        USCISQuestion(
            text: "How many amendments does the Constitution have?",
            possibleCorrectAnswers: [
                "27"
            ],
            possibleWrongAnswers: [
                "25",
                "26",
                "28"
            ]
        ),
        // 8
        USCISQuestion(
            text: "What did the Declaration of Independence do?",
            possibleCorrectAnswers: [
                "Announced our independence from Great Britain",
                "Declared our independence from Great Britain",
                "Said that the United States is free from Great Britain"
            ],
            possibleWrongAnswers: [
                "Announced our independence from Ireland",
                "Declared our independence from Spain",
                "Said that the United States is free from Italy"
            ]
        ),
        // 9
        USCISQuestion(
            text: "What are two rights in the Declaration of Independence?",
            possibleCorrectAnswers: [
                "Life and liberty",
                "Liberty and the pursuit of happiness",
                "Pursuit of happiness and life"
            ],
            possibleWrongAnswers: [
                "Property, personal wealth",
                "Education, safety",
                "Voting, free speech"
            ]
        ),
        // 10
        USCISQuestion(
            text: "What is freedom of religion?",
            possibleCorrectAnswers: [
                "You can practice any religion, or not practice a religion."
            ],
            possibleWrongAnswers: [
                "You must follow the state religion",
                "You can only practice Christianity",
                "You are free to tax religions"
            ]
        ),
        // 11
        USCISQuestion(
            text: "What is the economic system in the United States?",
            possibleCorrectAnswers: [
                "Capitalist economy",
                "Market economy"
            ],
            possibleWrongAnswers: [
                "Socialist economy",
                "Mixed feudal system",
                "Command economy"
            ]
        ),
        // 12
        USCISQuestion(
            text: "What is the “rule of law”?",
            possibleCorrectAnswers: [
                "Everyone must follow the law.",
                "Leaders must obey the law.",
                "Government must obey the law.",
                "No one is above the law."
            ],
            possibleWrongAnswers: [
                "Only citizens must obey laws",
                "The president makes the laws",
                "Laws apply only to non-citizens"
            ]
        ),
        // 13
        USCISQuestion(
            text: "Name one branch or part of the government.",
            possibleCorrectAnswers: [
                "Congress",
                "Legislative",
                "President",
                "Executive",
                "The courts",
                "Judicial"
            ],
            possibleWrongAnswers: [
                "Military",
                "Treasury",
                "Diplomatic",
                "I.R.S.",
                "E.R.S."
            ]
        ),
        // 14
        USCISQuestion(
            text: "What stops one branch of government from becoming too powerful?",
            possibleCorrectAnswers: [
                "Checks and balances",
                "Separation of powers"
            ],
            possibleWrongAnswers: [
                "Public elections",
                "The Bill of Rights",
                "State governments",
                "State Militias"
            ]
        ),
        // 15
        USCISQuestion(
            text: "Who is in charge of the executive branch?",
            possibleCorrectAnswers: [
                "The President"
            ],
            possibleWrongAnswers: [
                "The Speaker of the House",
                "The Chief Justice",
                "The Senate Majority Leader",
                "Not Trump"
            ]
        ),
        // 16
        USCISQuestion(
            text: "Who makes federal laws?",
            possibleCorrectAnswers: [
                "Congress",
                "Senate and House of Representatives",
                "U.S. or national legislature"
            ],
            possibleWrongAnswers: [
                "The President",
                "The Supreme Court",
                "The Cabinet",
                "Department of Justice",
                "il Donaldo Trumpo"
            ]
        ),
        // 17
        USCISQuestion(
            text: "What are the two parts of the U.S. Congress?",
            possibleCorrectAnswers: [
                "The Senate and House of Representatives"
            ],
            possibleWrongAnswers: [
                "The Cabinet and Senate",
                "The House and Supreme Court",
                "The Executive and Legislative"
            ]
        ),
        // 18
        USCISQuestion(
            text: "How many U.S. Senators are there?",
            possibleCorrectAnswers: [
                "100"
            ],
            possibleWrongAnswers: [
                "51",
                "98",
                "105"
            ]
        ),
        // 19
        USCISQuestion(
            text: "We elect a U.S. Senator for how many years?",
            possibleCorrectAnswers: [
                "6"
            ],
            possibleWrongAnswers: [
                "4",
                "5",
                "8"
            ]
        ),
        // 20
        USCISQuestion(
            text: "Who is one of your state’s U.S. Senators now?",
            possibleCorrectAnswers: [
                "[Your State’s Senator]"
            ],
            possibleWrongAnswers: [
                "The state governor",
                "A former senator",
                "A House representative"
            ]
        ),
        // 21
        USCISQuestion(
            text: "The House of Representatives has how many voting members?",
            possibleCorrectAnswers: [
                "435"
            ],
            possibleWrongAnswers: [
                "430",
                "440",
                "450"
            ]
        ),
        // 22
        USCISQuestion(
            text: "We elect a U.S. Representative for how many years?",
            possibleCorrectAnswers: [
                "2"
            ],
            possibleWrongAnswers: [
                "3",
                "4",
                "6"
            ]
        ),
        // 23
        USCISQuestion(
            text: "Name your U.S. Representative.",
            possibleCorrectAnswers: [
                "[Your Representative]"
            ],
            possibleWrongAnswers: [
                "A state senator",
                "A nearby district’s rep",
                "The governor"
            ]
        ),
        // 24
        USCISQuestion(
            text: "Who does a U.S. Senator represent?",
            possibleCorrectAnswers: [
                "All people of the state"
            ],
            possibleWrongAnswers: [
                "Only the state’s voters",
                "The state government",
                "The federal government"
            ]
        ),
        // 25
        USCISQuestion(
            text: "Why do some states have more Representatives than other states?",
            possibleCorrectAnswers: [
                "Because of the state’s population",
                "Because they have more people",
                "Because some states have more people"
            ],
            possibleWrongAnswers: [
                "Because of the state’s size",
                "Because of the state’s wealth",
                "Because of historical agreements"
            ]
        ),
        // 26
        USCISQuestion(
            text: "We elect a President for how many years?",
            possibleCorrectAnswers: [
                "4"
            ],
            possibleWrongAnswers: [
                "2",
                "5",
                "6"
            ]
        ),
        // 27
        USCISQuestion(
            text: "In what month do we vote for President?",
            possibleCorrectAnswers: [
                "November"
            ],
            possibleWrongAnswers: [
                "October",
                "December",
                "September"
            ]
        ),
        // 28
        USCISQuestion(
            text: "What is the name of the President of the United States now?",
            possibleCorrectAnswers: [
                "Donald J. Trump"
            ],
            possibleWrongAnswers: [
                "Joe Biden",
                "Kamala Harris",
                "Mike Pence",
                "il Donaldo Trumpo"
            ]
        ),
        // 29
        USCISQuestion(
            text: "What is the name of the Vice President of the United States now?",
            possibleCorrectAnswers: [
                "J.D. Vance"
            ],
            possibleWrongAnswers: [
                "Kamala Harris",
                "Mike Pence",
                "Nikki Haley"
            ]
        ),
        // 30
        USCISQuestion(
            text: "If the President can no longer serve, who becomes President?",
            possibleCorrectAnswers: [
                "The Vice President"
            ],
            possibleWrongAnswers: [
                "The Speaker of the House",
                "The Secretary of State",
                "The Chief Justice"
            ]
        ),
        // 31
        USCISQuestion(
            text: "If both the President and the Vice President can no longer serve, who becomes President?",
            possibleCorrectAnswers: [
                "The Speaker of the House"
            ],
            possibleWrongAnswers: [
                "The Senate Majority Leader",
                "The Secretary of Defense",
                "The Attorney General"
            ]
        ),
        // 32
        USCISQuestion(
            text: "Who is the Commander in Chief of the military?",
            possibleCorrectAnswers: [
                "The President"
            ],
            possibleWrongAnswers: [
                "The Secretary of Defense",
                "The Joint Chiefs of Staff",
                "The Vice President"
            ]
        ),
        // 33
        USCISQuestion(
            text: "Who signs bills to become laws?",
            possibleCorrectAnswers: [
                "The President"
            ],
            possibleWrongAnswers: [
                "The Speaker of the House",
                "The Senate Majority Leader",
                "The Chief Justice"
            ]
        ),
        // 34
        USCISQuestion(
            text: "Who vetoes bills?",
            possibleCorrectAnswers: [
                "The President"
            ],
            possibleWrongAnswers: [
                "Congress",
                "The Supreme Court",
                "The Vice President"
            ]
        ),
        // 35
        USCISQuestion(
            text: "What does the President’s Cabinet do?",
            possibleCorrectAnswers: [
                "Advises the President"
            ],
            possibleWrongAnswers: [
                "Makes laws",
                "Commands the military",
                "Interprets the Constitution"
            ]
        ),
        // 36
        USCISQuestion(
            text: "What are two Cabinet-level positions?",
            possibleCorrectAnswers: [
                "Secretary of Agriculture",
                "Secretary of Commerce",
                "Secretary of Defense",
                "Secretary of Education",
                "Secretary of Energy",
                "Secretary of Health and Human Services",
                "Secretary of Homeland Security",
                "Secretary of Housing and Urban Development",
                "Secretary of the Interior",
                "Secretary of Labor",
                "Secretary of State",
                "Secretary of Transportation",
                "Secretary of the Treasury",
                "Secretary of Veterans Affairs",
                "Attorney General",
                "Vice President"
            ],
            possibleWrongAnswers: [
                "Chief of Staff, Senator",
                "Governor, Mayor",
                "Speaker, Attorney"
            ]
        ),
        // 37
        USCISQuestion(
            text: "What does the judicial branch do?",
            possibleCorrectAnswers: [
                "Reviews laws",
                "Explains laws",
                "Resolves disputes or disagreements",
                "Decides if a law goes against the Constitution"
            ],
            possibleWrongAnswers: [
                "Makes laws",
                "Enforces laws",
                "Writes the Constitution"
            ]
        ),
        // 38
        USCISQuestion(
            text: "What is the highest court in the United States?",
            possibleCorrectAnswers: [
                "The Supreme Court"
            ],
            possibleWrongAnswers: [
                "The Federal Appeals Court",
                "The District Court",
                "The State Supreme Court"
            ]
        ),
        // 39
        USCISQuestion(
            text: "How many justices are on the Supreme Court?",
            possibleCorrectAnswers: [
                "9"
            ],
            possibleWrongAnswers: [
                "7",
                "8",
                "10"
            ]
        ),
        // 40
        USCISQuestion(
            text: "Who is the Chief Justice of the United States now?",
            possibleCorrectAnswers: [
                "John Roberts"
            ],
            possibleWrongAnswers: [
                "Clarence Thomas",
                "Sonia Sotomayor",
                "Brett Kavanaugh"
            ]
        ),
        // 41
        USCISQuestion(
            text: "Under our Constitution, some powers belong to the federal government. What is one power of the federal government?",
            possibleCorrectAnswers: [
                "To print money",
                "To declare war",
                "To create an army",
                "To make treaties"
            ],
            possibleWrongAnswers: [
                "To build roads",
                "To set taxes for states",
                "To run schools"
            ]
        ),
        // 42
        USCISQuestion(
            text: "Under our Constitution, some powers belong to the states. What is one power of the states?",
            possibleCorrectAnswers: [
                "Provide schooling and education",
                "Provide protection or police",
                "Provide safety or fire departments",
                "Give a driver’s license",
                "Approve zoning and land use"
            ],
            possibleWrongAnswers: [
                "Coin money",
                "Declare war",
                "Sign treaties"
            ]
        ),
        // 43
        USCISQuestion(
            text: "Who is the Governor of your state now?",
            possibleCorrectAnswers: [
                "[Your State’s Governor]"
            ],
            possibleWrongAnswers: [
                "A former governor",
                "A U.S. Senator",
                "A mayor"
            ]
        ),
        // 44
        USCISQuestion(
            text: "What is the capital of your state?",
            possibleCorrectAnswers: [
                "[Your State’s Capital]"
            ],
            possibleWrongAnswers: [
                "A major city in the state",
                "A neighboring state’s capital",
                "The largest city"
            ]
        ),
        // 45
        USCISQuestion(
            text: "What are the two major political parties in the United States?",
            possibleCorrectAnswers: [
                "Democratic and Republican"
            ],
            possibleWrongAnswers: [
                "Liberal and Conservative",
                "Federalist and Whig",
                "Green and Libertarian"
            ]
        ),
        // 46
        USCISQuestion(
            text: "What is the political party of the President now?",
            possibleCorrectAnswers: [
                "Republican"
            ],
            possibleWrongAnswers: [
                "Democratic",
                "Independent",
                "Libertarian"
            ]
        ),
        // 47
        USCISQuestion(
            text: "What is the name of the Speaker of the House of Representatives now?",
            possibleCorrectAnswers: [
                "Mike Johnson"
            ],
            possibleWrongAnswers: [
                "Nancy Pelosi",
                "Kevin McCarthy",
                "Paul Ryan"
            ]
        ),
        // 48
        USCISQuestion(
            text: "There are four amendments to the Constitution about who can vote. Describe one of them.",
            possibleCorrectAnswers: [
                "Citizens eighteen 18 and older can vote.",
                "You don’t have to pay a poll tax to vote.",
                "Any citizen can vote. Women and men can vote.",
                "A male citizen of any race can vote."
            ],
            possibleWrongAnswers: [
                "Only landowners can vote",
                "Voting is mandatory for all citizens",
                "Only white men can vote"
            ]
        ),
        // 49
        USCISQuestion(
            text: "What is one responsibility that is only for United States citizens?",
            possibleCorrectAnswers: [
                "Serve on a jury",
                "Vote in a federal election"
            ],
            possibleWrongAnswers: [
                "Pay taxes",
                "Obey state laws",
                "Attend school",
                "Be employed"
            ]
        ),
        // 50
        USCISQuestion(
            text: "Name one right only for United States citizens.",
            possibleCorrectAnswers: [
                "Right to vote in a federal election",
                "Right to run for federal office"
            ],
            possibleWrongAnswers: [
                "Right to education",
                "Right to healthcare",
                "Right to housing",
                "Right to vote",
                "Right to a job"
            ]
        ),
        // 51
        USCISQuestion(
            text: "What are two rights of everyone living in the United States?",
            possibleCorrectAnswers: [
                "Freedom of expression",
                "Freedom of speech",
                "Freedom of assembly",
                "Freedom to petition the government",
                "Freedom of religion",
                "The right to bear arms"
            ],
            possibleWrongAnswers: [
                "Right to vote, right to a job",
                "Right to bear arms, right to education",
                "Right to healthcare, right to housing",
                "Right to social security, right to healthcare",
                "Right to time off, right to a job",
                "Right to education, right to housing"
            ]
        ),
        // 52
        USCISQuestion(
            text: "What do we show loyalty to when we say the Pledge of Allegiance?",
            possibleCorrectAnswers: [
                "The United States",
                "The flag"
            ],
            possibleWrongAnswers: [
                "Our political party",
                "The sports team we are rooting for",
                "The original thirteen colonies"
            ]
        ),
        // 53
        USCISQuestion(
            text: "What is one promise you make when you become a United States citizen?",
            possibleCorrectAnswers: [
                "Give up loyalty to other countries",
                "Defend the Constitution and laws of the United States",
                "Obey the laws of the United States",
                "Serve in the U.S. military if needed",
                "Serve or do important work for the nation if needed",
                "Be loyal to the United States"
            ],
            possibleWrongAnswers: [
                "To pay our fair share of taxes",
                "To serve in Congress",
                "To live in the U.S. forever"
            ]
        ),
        // 54
        USCISQuestion(
            text: "How old do citizens have to be to vote for President?",
            possibleCorrectAnswers: [
                "18 and older"
            ],
            possibleWrongAnswers: [
                "16 and older",
                "19 and older",
                "21 and older"
            ]
        ),
        // 55
        USCISQuestion(
            text: "What are two ways that Americans can participate in their democracy?",
            possibleCorrectAnswers: [
                "Vote",
                "Join a political party",
                "Help with a campaign",
                "Join a civic group",
                "Join a community group",
                "Give an elected official your opinion on an issue",
                "Call Senators and Representatives",
                "Publicly support or oppose an issue or policy",
                "Run for office",
                "Write to a newspaper"
            ],
            possibleWrongAnswers: [
                "Pay taxes, attend church",
                "Serve in the military, own property",
                "Run businesses, travel abroad",
                "Make signs, wear patriotic jewelry"
            ]
        ),
        // 56
        USCISQuestion(
            text: "When is the last day you can send in federal income tax forms?",
            possibleCorrectAnswers: [
                "April 15"
            ],
            possibleWrongAnswers: [
                "April 30",
                "April 20",
                "April 11"
            ]
        ),
        // 57
        USCISQuestion(
            text: "When must all men register for the Selective Service?",
            possibleCorrectAnswers: [
                "At age eighteen 18",
                "Between eighteen 18 and 26"
            ],
            possibleWrongAnswers: [
                "At age 16",
                "At age 21",
                "When they enlist"
            ]
        ),
        // 58
        USCISQuestion(
            text: "What is one reason colonists came to America?",
            possibleCorrectAnswers: [
                "Freedom",
                "Political liberty",
                "Religious freedom",
                "Economic opportunity",
                "Practice their religion",
                "Escape persecution"
            ],
            possibleWrongAnswers: [
                "Fight the British",
                "Mine gold",
                "Join the army",
                "Better food"
            ]
        ),
        // 59
        USCISQuestion(
            text: "Who lived in America before the Europeans arrived?",
            possibleCorrectAnswers: [
                "American Indians",
                "Native Americans"
            ],
            possibleWrongAnswers: [
                "Colonists",
                "Pilgrims",
                "British settlers",
                "Nomads",
                "Spanish explorers"
            ]
        ),
        // 60
        USCISQuestion(
            text: "What group of people was taken to America and sold as slaves?",
            possibleCorrectAnswers: [
                "Africans",
                "people from Africa"
            ],
            possibleWrongAnswers: [
                "Various Europeans",
                "Asians",
                "Native Americans",
                "Irish prisoners of war",
                "Europeans",
                "Scottish prisoners of war",
                "Asians",
                "Middle Easterners"
            ]
        ),
        // 61
        USCISQuestion(
            text: "Why did the colonists fight the British?",
            possibleCorrectAnswers: [
                "Because of high taxes or taxation without representation",
                "Because the British army stayed in their houses for boarding, quartering",
                "Because they didn’t have self-government"
            ],
            possibleWrongAnswers: [
                "To gain more land",
                "To free the slaves",
                "To join the French",
                "To protest bad tea",
                "To protest unfair trade",
                "For using the same colors on their flag"
            ]
        ),
        // 62
        USCISQuestion(
            text: "Who wrote the Declaration of Independence?",
            possibleCorrectAnswers: [
                "Thomas Jefferson"
            ],
            possibleWrongAnswers: [
                "George Washington",
                "John Adams",
                "Benjamin Franklin",
                "James Madison",
                "Thomas Paine"
            ]
        ),
        // 63
        USCISQuestion(
            text: "When was the Declaration of Independence adopted?",
            possibleCorrectAnswers: [
                "July 4, 1776"
            ],
            possibleWrongAnswers: [
                "July 4, 1775",
                "June 4, 1776",
                "July 4, 1778"
            ]
        ),
        // 64
        USCISQuestion(
            text: "There were 13 original states. Name three.",
            possibleCorrectAnswers: [
                "New Hampshire",
                "Massachusetts",
                "Rhode Island",
                "Connecticut",
                "New York",
                "New Jersey",
                "Pennsylvania",
                "Delaware",
                "Maryland",
                "Virginia",
                "North Carolina",
                "South Carolina",
                "Georgia"
            ],
            possibleWrongAnswers: [
                "Florida, Texas, California",
                "Maine, Vermont, Ohio",
                "Alaska, Hawaii, Arizona"
            ]
        ),
        // 65
        USCISQuestion(
            text: "What happened at the Constitutional Convention?",
            possibleCorrectAnswers: [
                "The Constitution was written",
                "The Founding Fathers wrote the Constitution."
            ],
            possibleWrongAnswers: [
                "The Declaration was signed",
                "The Bill of Rights was repealed",
                "States gained independence",
                "Governors were elected"
            ]
        ),
        // 66
        USCISQuestion(
            text: "When was the Constitution written?",
            possibleCorrectAnswers: [
                "1787"
            ],
            possibleWrongAnswers: [
                "1776",
                "1789",
                "1791"
            ]
        ),
        // 67
        USCISQuestion(
            text: "The Federalist Papers supported the passage of the U.S. Constitution. Name one of the writers.",
            possibleCorrectAnswers: [
                "James Madison",
                "Alexander Hamilton",
                "John Jay",
                "Publius"
            ],
            possibleWrongAnswers: [
                "Thomas Jefferson",
                "George Washington",
                "Benjamin Franklin",
                "John Hancock"
            ]
        ),
        // 68
        USCISQuestion(
            text: "What is one thing Benjamin Franklin is famous for?",
            possibleCorrectAnswers: [
                "U.S. diplomat",
                "Oldest member of the Constitutional Convention",
                "First Postmaster General of the United States",
                "Writer of “Poor Richard’s Almanac”",
                "Started the first free libraries"
            ],
            possibleWrongAnswers: [
                "Writing the Constitution",
                "Leading the army",
                "Signing the Bill of Rights",
                "Inventing the light bulb"
            ]
        ),
        // 69
        USCISQuestion(
            text: "Who is the “Father of Our Country”?",
            possibleCorrectAnswers: [
                "George Washington"
            ],
            possibleWrongAnswers: [
                "Thomas Jefferson",
                "Abraham Lincoln",
                "John Adams",
                "Nate Bargatze"
            ]
        ),
        // 70
        USCISQuestion(
            text: "Who was the first President?",
            possibleCorrectAnswers: [
                "George Washington"
            ],
            possibleWrongAnswers: [
                "John Adams",
                "Thomas Jefferson",
                "James Madison",
                "Nate Bargatze",
                "il Donaldo Trumpo"
            ]
        ),
        // 71
        USCISQuestion(
            text: "What territory did the United States buy from France in 1803?",
            possibleCorrectAnswers: [
                "The Louisiana Territory",
                "Louisiana"
            ],
            possibleWrongAnswers: [
                "Florida",
                "Texas",
                "California",
                "Texas",
                "California"
            ]
        ),
        // 72
        USCISQuestion(
            text: "Name one war fought by the United States in the 1800s.",
            possibleCorrectAnswers: [
                "War of 1812",
                "Mexican-American War",
                "Civil War",
                "Spanish-American War"
            ],
            possibleWrongAnswers: [
                "Revolutionary War",
                "World War I",
                "Vietnam War",
                "War of Southern Expansion",
                "War of the Worlds"
            ]
        ),
        // 73
        USCISQuestion(
            text: "Name the U.S. war between the North and the South.",
            possibleCorrectAnswers: [
                "The Civil War",
                "The War between the States"
            ],
            possibleWrongAnswers: [
                "The War of 1812",
                "The Spanish-American War",
                "The Revolutionary War",
                "The Mason Dixon Conflict"
            ]
        ),
        // 74
        USCISQuestion(
            text: "Name one problem that led to the Civil War.",
            possibleCorrectAnswers: [
                "Slavery",
                "Economic reasons",
                "States’ rights"
            ],
            possibleWrongAnswers: [
                "Taxation",
                "Foreign invasion",
                "Religious disputes",
                "Land claims"
            ]
        ),
        // 75
        USCISQuestion(
            text: "What was one important thing that Abraham Lincoln did?",
            possibleCorrectAnswers: [
                "Freed the slaves - Emancipation Proclamation",
                "Saved or preserved the Union",
                "Led the United States during the Civil War"
            ],
            possibleWrongAnswers: [
                "Wrote the Constitution",
                "Ended the Revolutionary War",
                "Bought Louisiana"
            ]
        ),
        // 76
        USCISQuestion(
            text: "What did the Emancipation Proclamation do?",
            possibleCorrectAnswers: [
                "Freed the slaves",
                "Freed slaves in the Confederacy",
                "Freed slaves in the Confederate states",
                "Freed slaves in most Southern states"
            ],
            possibleWrongAnswers: [
                "Ended the Civil War",
                "Gave women the vote",
                "Created the Union"
            ]
        ),
        // 77
        USCISQuestion(
            text: "What did Susan B. Anthony do?",
            possibleCorrectAnswers: [
                "Fought for women’s rights",
                "Fought for civil rights"
            ],
            possibleWrongAnswers: [
                "Freed the slaves",
                "Invented the telephone",
                "Led the Union army",
                "Invented the sewing machine"
            ]
        ),
        // 78
        USCISQuestion(
            text: "Name one war fought by the United States in the 1900s.",
            possibleCorrectAnswers: [
                "World War I",
                "World War II",
                "Korean War",
                "Vietnam War",
                "Persian Gulf War"
            ],
            possibleWrongAnswers: [
                "Revolutionary War",
                "Civil War",
                "War of 1812"
            ]
        ),
        // 79
        USCISQuestion(
            text: "Who was President during World War I?",
            possibleCorrectAnswers: [
                "Woodrow Wilson"
            ],
            possibleWrongAnswers: [
                "Franklin Roosevelt",
                "Theodore Roosevelt",
                "Herbert Hoover",
                "Calvin Coolidge",
                "Thomas Jefferson"
            ]
        ),
        // 80
        USCISQuestion(
            text: "Who was President during the Great Depression and World War II?",
            possibleCorrectAnswers: [
                "Franklin Roosevelt"
            ],
            possibleWrongAnswers: [
                "Herbert Hoover",
                "Harry Truman",
                "Dwight Eisenhower",
                "Calvin Coolidge"
            ]
        ),
        // 81
        USCISQuestion(
            text: "Who did the United States fight in World War II?",
            possibleCorrectAnswers: [
                "Japan, Germany, and Italy"
            ],
            possibleWrongAnswers: [
                "France, Spain, Russia",
                "Britain, Canada, Mexico",
                "China, Korea, Vietnam",
                "Spain, Portugal, Vietnam",
                "China, Mexico, Korea"
            ]
        ),
        // 82
        USCISQuestion(
            text: "Before he was President, Eisenhower was a general. What war was he in?",
            possibleCorrectAnswers: [
                "World War II"
            ],
            possibleWrongAnswers: [
                "World War I",
                "Korean War",
                "Vietnam War",
                "The Gulf War"
            ]
        ),
        // 83
        USCISQuestion(
            text: "During the Cold War, what was the main concern of the United States?",
            possibleCorrectAnswers: [
                "Communism"
            ],
            possibleWrongAnswers: [
                "Fascism",
                "Imperialism",
                "Terrorism",
                "Racism",
                "Climate Change",
                "Rising Sea Levels",
                "Polar Bear Population Decline"
            ]
        ),
        // 84
        USCISQuestion(
            text: "What movement tried to end racial discrimination?",
            possibleCorrectAnswers: [
                "Civil rights movement"
            ],
            possibleWrongAnswers: [
                "Women’s suffrage",
                "Labor movement",
                "Prohibition",
                "Waco siege"
            ]
        ),
        // 85
        USCISQuestion(
            text: "What did Martin Luther King, Jr. do?",
            possibleCorrectAnswers: [
                "Fought for civil rights",
                "Worked for equality for all Americans"
            ],
            possibleWrongAnswers: [
                "Ended slavery",
                "Led the American Revolution",
                "Signed the Constitution",
                "Fought in World War I"
            ]
        ),
        // 86
        USCISQuestion(
            text: "What major event happened on September 11, 2001, in the United States?",
            possibleCorrectAnswers: [
                "Terrorists attacked the United States."
            ],
            possibleWrongAnswers: [
                "The Iraq War began",
                "The stock market crashed",
                "A new president was elected",
                "Fort Knox was invaded"
            ]
        ),
        // 87
        USCISQuestion(
            text: "Name one American Indian tribe in the United States.",
            possibleCorrectAnswers: [
                "Cherokee",
                "Navajo",
                "Sioux",
                "Chippewa",
                "Choctaw",
                "Pueblo",
                "Apache",
                "Iroquois",
                "Creek",
                "Blackfeet",
                "Seminole",
                "Cheyenne",
                "Arawak",
                "Shawnee",
                "Mohegan",
                "Huron",
                "Oneida",
                "Lakota",
                "Crow",
                "Teton",
                "Hopi",
                "Inuit"
            ],
            possibleWrongAnswers: [
                "Tawanka",
                "Shilohani",
                "Kemoweta",
                "Nuvari",
                "Chaskanopa",
                "Peltori",
                "Yanusee",
                "Mirakota",
                "Sowendi",
                "Valthira"
            ]
        ),
        // 88
        USCISQuestion(
            text: "Name one of the two longest rivers in the United States.",
            possibleCorrectAnswers: [
                "Missouri River",
                "Mississippi River"
            ],
            possibleWrongAnswers: [
                "Ohio River",
                "Colorado River",
                "Hudson River",
                "Susquahita River"
            ]
        ),
        // 89
        USCISQuestion(
            text: "What ocean is on the West Coast of the United States?",
            possibleCorrectAnswers: [
                "Pacific Ocean"
            ],
            possibleWrongAnswers: [
                "Atlantic Ocean",
                "Indian Ocean",
                "Arctic Ocean"
            ]
        ),
        // 90
        USCISQuestion(
            text: "What ocean is on the East Coast of the United States?",
            possibleCorrectAnswers: [
                "Atlantic Ocean"
            ],
            possibleWrongAnswers: [
                "Pacific Ocean",
                "Gulf of America",
                "Caribbean Sea"
            ]
        ),
        // 91
        USCISQuestion(
            text: "Name one U.S. territory.",
            possibleCorrectAnswers: [
                "Puerto Rico",
                "U.S. Virgin Islands",
                "American Samoa",
                "Northern Mariana Islands",
                "Guam"
            ],
            possibleWrongAnswers: [
                "Florida",
                "Hawaii",
                "Alaska",
                "Detriot"
            ]
        ),
        // 92
        USCISQuestion(
            text: "Name one state that borders Canada.",
            possibleCorrectAnswers: [
                "Maine",
                "New Hampshire",
                "Vermont",
                "New York",
                "Pennsylvania",
                "Ohio",
                "Michigan",
                "Minnesota",
                "North Dakota",
                "Montana",
                "Idaho",
                "Washington",
                "Alaska"
            ],
            possibleWrongAnswers: [
                "California",
                "Texas",
                "Florida",
                "Georgia",
                "Illinois",
                "Missouri",
                "Kansas",
                "Iowa",
                "Arkansas",
                "Louisiana",
                "Mississippi",
                "Alabama",
                "South Carolina",
                "North Carolina"
            ]
        ),
        // 93
        USCISQuestion(
            text: "Name one state that borders Mexico.",
            possibleCorrectAnswers: [
                "California",
                "Arizona",
                "New Mexico",
                "Texas"
            ],
            possibleWrongAnswers: [
                "Nevada",
                "Colorado",
                "Oklahoma",
                "Wyoming",
                "Utah",
                "Montana",
                "Idaho",
                "Washington",
                "Alaska",
                "Hawaii",
                "Vermont",
                "Maine",
                "New Hampshire",
                "Connecticut",
                "Rhode Island",
                "Massachusetts",
                "New York",
                "Pennsylvania",
                "Delaware"
            ]
        ),
        // 94
        USCISQuestion(
            text: "What is the capital of the United States?",
            possibleCorrectAnswers: [
                "Washington, D.C."
            ],
            possibleWrongAnswers: [
                "New York City",
                "Philadelphia",
                "Boston",
                "San Francisco",
                "Hartford",
                "Harrisburg",
                "Atlanta"
            ]
        ),
        // 95
        USCISQuestion(
            text: "Where is the Statue of Liberty?",
            possibleCorrectAnswers: [
                "New York Harbor",
                "Liberty Island",
                "New Jersey",
                "Near New York City",
                "On the Hudson River"
            ],
            possibleWrongAnswers: [
                "Delaware",
                "Susquehanna River",
                "Near Subic Bay"
            ]
        ),
        // 96
        USCISQuestion(
            text: "Why does the flag have 13 stripes?",
            possibleCorrectAnswers: [
                "Because there were 13 original colonies",
                "Because the stripes represent the original colonies"
            ],
            possibleWrongAnswers: [
                "Because there are 13 months",
                "Because it was a popular design",
                "Because it was a lucky number",
                "Because it was a design by Benjamin Franklin",
                "Because it was a design by George Washington",
                "Because it represents the 13 tribes of man"
            ]
        ),
        // 97
        USCISQuestion(
            text: "Why does the flag have 50 stars?",
            possibleCorrectAnswers: [
                "Because there is one star for each state",
                "Because each star represents a state",
                "Because there are 50 states"
            ],
            possibleWrongAnswers: [
                "Because 50 is considered a lucky number",
                "Because Susan B. Anthony was 50 when she created it",
                "Because one star indicates each senator"
            ]
        ),
        // 98
        USCISQuestion(
            text: "What is the name of the national anthem?",
            possibleCorrectAnswers: [
                "The Star-Spangled Banner"
            ],
            possibleWrongAnswers: [
                "Land of the Lost",
                "America the Beautiful",
                "Sweet Home Alabama",
                "God Bless America",
                "My Country, 'Tis of Thee",
                "Yankee Doodle",
                "Battle Hymn of the Republic",
                "This Land Is Your Land",
                "God Bless the U.S.A.",
                "The Stars and Stripes Forever",
                "Columbia, the Gem of the Ocean",
                "Hail, Columbia",
                "America (My Country, 'Tis of Thee)",
                "When Johnny Comes Marching Home",
                "You're a Grand Old Flag",
                "Over There",
                "Sweet Georgia Brown",
                "Anchors Aweigh",
                "The Army Goes Rolling Along",
                "The Marines' Hymn",
                "Semper Paratus",
                "The U.S. Air Force (Wild Blue Yonder)",
                "Dixie",
                "Home on the Range",
                "Take Me Home, Country Roads",
                "Born in the U.S.A.",
                "Sweet Caroline"
            ]
        ),
        // 99
        USCISQuestion(
            text: "When do we celebrate Independence Day?",
            possibleCorrectAnswers: [
                "July 4"
            ],
            possibleWrongAnswers: [
                "July 5",
                "July 14",
                "July 20"
            ]
        ),
        // 100
        USCISQuestion(
            text: "Name two national U.S. holidays.",
            possibleCorrectAnswers: [
                "New Year’s Day",
                "Martin Luther King, Jr. Day",
                "Presidents’ Day",
                "Memorial Day",
                "Independence Day",
                "Labor Day",
                "Columbus Day",
                "Veterans Day",
                "Thanksgiving",
                "Christmas"
            ],
            possibleWrongAnswers: [
                "Black History Month",
                "Groundhog Day",
                "Super Bowl Sunday",
                "Pi Day",
                "Earth Day",
                "Arbor Day",
                "Flag Day",
                "National Ice Cream Day",
                "Talk Like a Pirate Day",
                "National Pancake Day",
                "Black Friday"
            ]
        )
    ]
}
