;;; init.el -*- lexical-binding: t; -*-

;; NOTE: this is a slimmed down version of doom-emacs/init.example.el

(setq no-native-compile t
      straight-disable-native-compile t)

(doom! :completion
       company           ; the ultimate code completion backend
       ivy               ; a search engine for love and life

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       (modeline +light)   ; snazzy, Atom-inspired modeline, plus API
       ophints           ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave)  ; automated prettiness
       snippets          ; my elves. They type so I don't have to

       :emacs
       dired             ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       vterm

       :checkers
       syntax              ; tasing you for every semicolon you forget

       :tools
       (debugger +lsp)         ; FIXME stepping through code, to help you add bugs
       editorconfig      ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       magit             ; a git porcelain for Emacs

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       (cc +lsp)                ; C > C++ == 1
       (clojure +lsp)           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       (csharp +lsp)           ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       (go +lsp)         ; the hipster dialect
       (haskell +dante +lsp)  ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       json              ; At least it ain't XML
       (java +meghanada +lsp) ; the poster child for carpal tunnel syndrome
       (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
       (julia +lsp)             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       (lua +lsp)              ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       org               ; organize your plain life in plain text
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       (python +lsp)           ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       (ruby +rails +lsp)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (scala +lsp)            ; java, but good
       (scheme +guile)   ; a fully conniving family of lisps
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes
       ;;yaml              ; JSON, but readable
       (zig +lsp)              ; C, but simpler

       :config
       (default +bindings +smartparens))
