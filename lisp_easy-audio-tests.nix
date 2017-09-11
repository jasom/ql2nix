
{ buildLispPackage, stdenv, fetchurl, lisp-project_easy-audio, 
   lisp_easy-audio, lisp_fiveam, lisp_flexi-streams,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_easy-audio lisp_fiveam lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "easy-audio-tests";
      
      sourceProject = "${lisp-project_easy-audio}";
      patches = [];
      lisp_dependencies = "${lisp_easy-audio} ${lisp_fiveam} ${lisp_flexi-streams}";
      name = "lisp_easy-audio-tests-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
