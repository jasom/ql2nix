
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_alexandria, lisp_babel, lisp_cl-ppcre, lisp_fast-io, lisp_maiden-activatable, lisp_maiden-client-entities, lisp_maiden-commands, lisp_maiden-storage, lisp_parse-number,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_babel lisp_cl-ppcre lisp_fast-io lisp_maiden-activatable lisp_maiden-client-entities lisp_maiden-commands lisp_maiden-storage lisp_parse-number  ];
      inherit stdenv;
      systemName = "maiden-markov";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_babel} ${lisp_cl-ppcre} ${lisp_fast-io} ${lisp_maiden-activatable} ${lisp_maiden-client-entities} ${lisp_maiden-commands} ${lisp_maiden-storage} ${lisp_parse-number}";
      name = "lisp_maiden-markov-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
