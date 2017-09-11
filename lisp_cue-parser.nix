
{ buildLispPackage, stdenv, fetchurl, lisp-project_cue-parser, 
   lisp_esrap, lisp_flexi-streams,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_flexi-streams  ];
      inherit stdenv;
      systemName = "cue-parser";
      
      sourceProject = "${lisp-project_cue-parser}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_flexi-streams}";
      name = "lisp_cue-parser-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
