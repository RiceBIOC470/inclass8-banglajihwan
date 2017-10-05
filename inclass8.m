%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100.
seq1 = randseq(100) 
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
seq2 = [seq1(1:40) randseq(20) seq1(61:100)]
% C. run swalign on the two sequences with the default parameters
swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true); 
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results.
[score, align, start] =swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true, 'GapOpen', 1000);
[score, align, start] =swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true, 'GapOpen', 0.001);

%--> when gap open is much greater than default, the number of gaps in
%the aligned sequences decrease. Gap open penality is big and therefore the
%script tries to reduce gaps. 
%--> when the gap open is much smaller than default the number of gaps in
%the aligned sequences increae. Gap penality is small and therefore having
%many gaps does not decrease the alignment score too much. 

% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
[score, align, start] =swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true, 'GapOpen', 0.001, 'ExtendGap', 100);
%--> With this parameter, I see gaps with only the length of 1. This is
%because there is high penality for extending the gap. This is called
%affined gap penality where the starting gap and extending gaps have
%different penality. 

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 
[score, align, start] =swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true, 'ExtendGap', 0.001);
%--> With this parameter we see longer gaps. Extending gap has small
%penality. This increases the length of the gaps. 

