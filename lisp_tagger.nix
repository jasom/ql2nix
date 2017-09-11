
{ buildLispPackage, stdenv, fetchurl, lisp-project_tagger, 
   lisp_closer-mop, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fiveam  ];
      inherit stdenv;
      systemName = "tagger";
      
      sourceProject = "${lisp-project_tagger}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fiveam}";
      name = "lisp_tagger-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
