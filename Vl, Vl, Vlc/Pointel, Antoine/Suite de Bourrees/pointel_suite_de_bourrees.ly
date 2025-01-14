\version "2.20.2"
\include "deutsch.ly"
  
#(set-global-staff-size 22)

\header {
  title     = \markup \bold \italic "Suite de Bourrées"
  composer  = "Antoine Pointel"
  arranger  = "arr.: Michel Rondeau"
  enteredby = "cellist (2021-03-12)"
  piece     = "Deusiesme recuiel des dances et contre-dances (1688)"
}

voiceconsts = {
  \key c \major
  \time 2/2
  \clef "treble"
% \numericTimeSignature
  % Set default beaming for all staves
%  \set Timing.beamExceptions = #'()
%  \set Timing.baseMoment     = #(ly:make-moment 1 4)
%  \set Timing.beatStructure  = #'(1 1 1)
}

introa = {        \tempo "1. Bourrée D'Orange - Moderato " 2=85 }
introb = { \break \tempo "2. Bourrée - Moderato " 2=85 \key f \major }
introc = { \break \tempo "3. Bourrée - Moderato " 2=85 \key c \major }

mivl = "violin"
miba = "cello"

\include "v1.ily"
\include "v2.ily"
\include "v3.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mivl
	\set Staff.instrumentName = \markup \center-column { "Violine" "I" }
	\transpose c c { \va }
      }
      
      \new Staff {
	\set Staff.midiInstrument = \mivl
	\set Staff.instrumentName = \markup \center-column { "Violine" "II" }
	\transpose c c { \vb }
      }
      
      \new Staff {
	\set Staff.midiInstrument = \miba
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello" }
	\transpose c c { \vc }
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
        "Antoine Pointel - Suite de Bourrées" \fromproperty #'page:page-number-string
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