#lang sicp

;; ex 4.59

;; a.
(meeting ?div (Friday . ?time))

;; b.
(rule (meeting-time ?person ?day-and-time)
      (or (meeting whole-company ?day-and-time)
          (and (job ?person (?division . ?rest))
               (meeting ?division ?day-and-time))))

;; c.
(meeting-time (Hacker Alyssa P) ?day-and-time)
