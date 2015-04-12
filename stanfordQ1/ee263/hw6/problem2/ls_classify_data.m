% data for least-squares classification problem
n = 3;
N = 100;
% X matrix
X = [...
    27 23 14;
    1 25 13;
    18 24 28;
    22 5 12;
    28 28 12;
    27 2 11;
    24 0 4;
    6 6 18;
    8 6 0;
    22 13 28;
    14 13 25;
    16 6 20;
    25 1 20;
    11 25 15;
    21 13 9;
    6 6 20;
    9 16 5;
    21 11 26;
    26 18 15;
    27 25 19;
    25 20 10;
    9 10 16;
    22 9 25;
    17 11 21;
    16 13 21;
    19 24 29;
    16 26 5;
    29 8 8;
    26 22 4;
    0 27 6;
    9 20 9;
    14 2 30;
    17 13 15;
    10 13 7;
    17 23 16;
    19 6 11;
    23 20 14;
    17 24 2;
    18 2 12;
    9 26 0;
    23 29 30;
    24 13 15;
    6 19 10;
    29 22 12;
    22 8 13;
    28 20 6;
    25 19 4;
    6 18 19;
    11 17 14;
    1 1 9;
    0 12 20;
    3 1 18;
    18 0 0;
    6 18 2;
    11 19 22;
    21 3 14;
    13 11 5;
    20 21 22;
    14 17 4;
    14 21 27;
    8 8 26;
    7 24 27;
    7 7 1;
    2 19 6;
    25 5 5;
    30 13 10;
    9 11 12;
    18 4 1;
    14 26 28;
    8 5 26;
    7 19 29;
    20 26 0;
    4 25 13;
    27 22 21;
    10 5 5;
    6 13 26;
    15 24 14;
    14 14 12;
    27 0 9;
    1 21 20;
    29 17 12;
    6 19 22;
    11 0 13;
    23 24 28;
    25 11 19;
    22 6 27;
    17 19 7;
    16 28 10;
    20 12 19;
    21 12 12;
    20 25 11;
    13 18 17;
    21 15 23;
    15 6 21;
    29 24 21;
    15 3 20;
    11 4 17;
    25 20 30;
    29 2 11;
    16 8 18;
]';
y = [...
   1;
   -1;
   1;
   -1;
   1;
   1;
   -1;
   -1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   1;
   -1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   1;
   -1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   -1;
   -1;
   -1;
   -1;
   -1;
   -1;
   1;
   -1;
   -1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   1;
   1;
   -1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   1;
   -1;
   -1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   1;
   1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   1;
   1;
   1;
];
Xtest = [...
    1 17 21;
    29 23 22;
    13 19 24;
    3 28 27;
    18 8 26;
    15 22 13;
    29 2 17;
    9 26 10;
    20 2 11;
    15 13 17;
    18 3 27;
    23 24 24;
    20 6 8;
    19 16 2;
    3 8 12;
    14 27 18;
    10 14 18;
    5 25 29;
    18 1 24;
    18 21 3;
    13 11 5;
    25 25 14;
    29 4 26;
    23 13 19;
    29 19 7;
    11 6 15;
    12 14 18;
    2 9 18;
    5 19 7;
    18 15 14;
    16 28 10;
    12 9 12;
    9 12 15;
    22 9 3;
    13 14 0;
    20 22 8;
    8 21 24;
    30 14 27;
    14 24 25;
    5 12 16;
    22 17 14;
    13 3 13;
    11 9 26;
    23 28 17;
    0 18 24;
    29 7 21;
    16 28 21;
    7 13 5;
    29 11 1;
    23 27 9;
    8 28 4;
    28 21 25;
    6 14 2;
    26 17 10;
    11 26 11;
    2 6 1;
    17 4 16;
    4 23 11;
    25 1 18;
    28 9 27;
    3 2 7;
    28 2 8;
    30 6 15;
    9 20 29;
    23 20 4;
    3 0 9;
    25 30 1;
    25 19 17;
    7 25 8;
    23 20 6;
    18 18 20;
    6 19 5;
    16 19 21;
    20 26 0;
    9 23 9;
    28 20 2;
    2 0 7;
    15 14 21;
    17 15 2;
    6 11 8;
    23 9 19;
    30 15 28;
    25 28 3;
    24 27 5;
    4 23 22;
    20 23 20;
    27 8 13;
    6 1 2;
    26 10 14;
    27 7 26;
    20 27 15;
    30 11 16;
    5 15 13;
    20 20 29;
    6 3 17;
    29 1 26;
    1 16 6;
    21 8 28;
    4 16 27;
    28 10 13;
]';
ytest = [...
   -1;
   1;
   1;
   -1;
   1;
   1;
   1;
   -1;
   -1;
   1;
   1;
   1;
   -1;
   -1;
   -1;
   -1;
   -1;
   1;
   1;
   -1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   -1;
   -1;
   -1;
   -1;
   1;
   -1;
   -1;
   -1;
   -1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   1;
   -1;
   -1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   -1;
   -1;
   1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   1;
   -1;
   -1;
   1;
   -1;
   1;
   -1;
   -1;
   1;
   -1;
   -1;
   -1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   1;
   1;
   -1;
   1;
   1;
   1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   1;
   -1;
   1;
];
