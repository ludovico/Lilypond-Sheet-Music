\version "2.20.2"
\include "deutsch.ly"

#(set-global-staff-size 20)

\header {
  title     = \markup \bold \italic \center-column {
    "Spielstück für" "zwei Violinen"
  }
  composer  = "Heinz Irsen (1906-1989)"
  arranger  = "arr.: Werner Icking"
  enteredby = "cellist (2021-09-03)"
  piece     = "op. 40 (1931)"
}

voiceconsts = {
 \key c \major
 \time 4/4
% \clef "bass"
 \clef "treble"
% \numericTimeSignature
 \compressEmptyMeasures
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
 \tempo "Lebhaft " 4=120
}

mivl = "violin"
miba = "cello"

barc = \markup \italic "(arco)"
bpiz = \markup \italic "(pizz.)"
dcaf = \mark \markup \box \italic "D.C. al Fine"
fine = \mark \markup \box \italic "Fine"
pizz = \markup \italic "pizz."
rit  = \mark \markup \box \italic "rit."

\include "v1.ily"
\include "v2.ily"

music = \new StaffGroup <<
      \new Staff {
        \set Staff.midiInstrument = \mivl
        \set Staff.instrumentName = \markup \center-column { "Violine" }
        \transpose c c { \va }
      }
      
      \new Staff {
        \set Staff.midiInstrument = \miba
        \set Staff.instrumentName = \markup \center-column { "Violon-" "cello" }
        \transpose c c { \vb }
      }
>>

\book {
  \paper {
    print-page-number = ##t
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    oddFooterMarkup = \markup {
      \fill-line {
        \on-the-fly #print-page-number-check-first
        "Heinz Irsen - Spielstück für zwei Violinen" \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
  } \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}